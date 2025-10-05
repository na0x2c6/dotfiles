#!/bin/bash

set -Eeuvo pipefail

pushd $(dirname $0)

dconf dump /org/gnome/desktop/wm/keybindings/             > dconf-org-gnome-desktop-wm-keybindings.ini
dconf dump /org/gnome/shell/keybindings/                  > dconf-org-gnome-shell-keybindings.ini
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > dconf-org-gnome-settings-daemon-plugins-media-keys.ini
dconf dump /org/gnome/desktop/interface/                  > dconf-org-gnome-dektop-interface.ini
dconf dump /org/gnome/terminal/legacy/                    > dconf-org-gnome-terminal-legacy.ini
dconf dump /org/gnome/mutter/                             > dconf-org-gnome-mutter.ini

popd
