#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin;
if [ -d ~/bin ]; then
    PATH=~/bin:$PATH;
fi
export PLATFORM=`uname`;
if [ ! "$PLATFORM" ]; then
    PLATFORM='Linux';
fi
