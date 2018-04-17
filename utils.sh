#!/bin/bash
# @author: zhaoyk2010@163.com
# This is a library of Bash shell utilities.

source $MYSHELLIB/env.sh;
source $MYSHELLIB/echoc.sh;

##############################################
# Error processing.
##############################################
function die() {
    echoc red "${@}";
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


