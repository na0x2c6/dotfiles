#!/bin/bash

set -Eeuv


if [[ $(uname -s) != "Linux" ]] ; then
    exit 0
fi

if type copyq > /dev/null ; then
    exit 0
fi

sudo dnf install -y copyq
