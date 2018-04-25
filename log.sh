#!/bin/bash
# @author: zhaoyk2010@163.com
# This is a library of Bash shell logging.

source $MYSHELLIB/env.sh;
source $MYSHELLIB/echoc.sh;

declare LOG_FILE='/var/tmp/myshell.log';

function log() {
    if [ $# -eq 2 ]; then
        echoc "$1" "$2";
        shift;
    else
        echo "$1";
    fi
    if [ "$LOG_FILE" ]; then
        echo "$1" >> $LOG_FILE;
    fi
}

function debug() {
    log "[DEBUG] ${@}";
}

function info() {
    log "[INFO] ${@}";
}

function notice() {
    log Yellow "[WARN] ${@}";
}

function warn() {
    log Yellow "[WARN] ${@}";
}

function error() {
    log Red "[ERROR] ${@}";
}
