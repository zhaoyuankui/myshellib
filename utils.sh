#!/bin/bash
# @author: zhaoyk2010@163.com
# This is a library of Bash shell utilities.

source $MYSHELLIB/env.sh;
source $MYSHELLIB/echoc.sh;

##############################################
# Error processing.
##############################################
function die() {
    echoc Red "${@}";
    exit 1;
}

##############################################
# Compatible between linux and Mac.
##############################################
function SED() {
    if [ 'Darwin' != "$PLATFORM" ]; then
        sed "${@}";
        return;
    fi
    declare -a params=("${@}");
    declare -a new_params=();
    declare -i j=0;
    for ((i = 0; i < ${#params[@]}; ++i)); do
        new_params[$j]=${params[$i]};
        j=$((j+1));
        if [ "${params[$i]}" == '-i' ]; then
            new_params[$j]="";
            j=$((j+1));
        fi
    done
    sed "${new_params[@]}";
}

##############################################
# String processing.
##############################################
function not_empty() {
    if [ "$1" ]; then
        return 0;
    fi
    return 1;
}

##############################################
# Date and time functions.
##############################################
function daytime() {
    date '+%Y-%m-%d %H:%M:%S';
}

function daytime2() {
    date '+%Y%m%d%H%M%S';
}

function day() {
    date '+%Y-%m-%d';
}

function day2() {
    date '+%Y%m%d';
}

function timestamp() {
    date '+%s';
}

##############################################
# File system functions.
##############################################
# Traverse the directory.
# @param $1 required  The path to be traverse.
# @param $2 required  The processor to process the path.
# @param $3 optional  The filter.
function traverse() {
    if [ $# -lt 2 ]; then
        die 'Missing required parameters';
    fi
    declare -i depth=1000;
    _do_traverse $depth "$1" "$2" "$3";
}

function _do_traverse() {
    declare -i depth=$1;
    declare path="$2";
    declare processor="$3";
    declare filter="$4";
	if [ $depth -le 0 ]; then
		die "The depth of path '$path' is too large. Exit gracefully!";
		return 1;
	fi
	depth=$depth-1;
    if [ ! "$filter" ] || $filter "$path"; then
        $processor "$path";
    fi

    if [ ! -d "$path" ]; then
        return 0;
    fi

	for file in `ls -a "$path" | tr ' ' '?'`; do
        # Trim the blank spaces at its head and tail.
		file="`echo $file | tr '?' ' '`"
        # Escape the "." directory to avoid forever recursive.
		if [ "$file" == "." ] || [ "$file" == ".." ]; then
			continue
		fi

		file="$path/$file"
        _do_traverse $depth "$file" "$processor" "$filter";
        if [ 0 -ne $? ]; then
            return $?;
        fi
	done
}

