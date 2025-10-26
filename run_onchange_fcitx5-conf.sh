#!/bin/bash

set -Eev

if [[ $(uname -s) != "Linux" ]] || ! type fcitx5 2>&1 > /dev/null ; then
    exit 0
fi

# hash: {{ include "dot_config/private_fcitx5/private_config" | sha256sum }}
fcitx5 -r -d
