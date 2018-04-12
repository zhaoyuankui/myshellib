#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin;
export PLATFORM=`uname`;
if [ ! "$PLATFORM" ]; then
    PLATFORM='Linux';
fi
