#!/bin/bash

set -Eeuv


if [[ $(uname -s) != "Linux" ]] ; then
    exit 0
fi

sudo dnf install -y copyq tmux wl-clipboard \
    adobe-source-han-code-jp-fonts adobe-source-han-sans-jp-fonts
