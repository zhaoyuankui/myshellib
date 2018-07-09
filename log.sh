#!/bin/bash
# @author: zhaoyk2010@163.com
# This is a library of Bash shell logging.

source $MYSHELLIB/env.sh;
source $MYSHELLIB/echoc.sh;
source $MYSHELLIB/utils.sh

declare LOG_FILE='/var/tmp/myshell.log';

function _myshell_log() {
    if [ $# -eq 2 ]; then
        echoc "$1" "$2";
        shift;
    else
        echo "$1";
    fi
    if [ "$LOG_FILE" ]; then
        echo "[`daytime`] $1" >> $LOG_FILE;
    fi
}

function debug() {
    _myshell_log "[DEBUG] ${*}";
}

function info() {
    _myshell_log "[INFO] ${*}";
}

function notice() {
    _myshell_log Yellow "[WARN] ${*}";
}

function warn() {
    _myshell_log Yellow "[WARN] ${*}";
}

function error() {
    _myshell_log Red "[ERROR] ${*}";
}
