#!/bin/bash
# @author: zhaoyk2010@163.com
# This is a library of Bash shell logging.

source $MYSHELLIB/env.sh;
source $MYSHELLIB/echoc.sh;

function debug() {
    echo "[DEBUG] ${@}";
}

function info() {
    echo "[INFO] ${@}";
}

function warn() {
    echoc Yellow "[WARN] ${@}";
}

function error() {
    echoc Red "[ERROR] ${@}";
}
