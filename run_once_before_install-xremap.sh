#!/bin/bash
# see: https://github.com/k0kubun/xremap

set -Eeuv

if [[ $(uname -s) != "Linux" ]] ; then
    exit 0
fi

if [[ -e ~/.cargo/bin/xremap ]] ; then
    exit 0
fi

sudo dnf -y install rust cargo

mkdir -p ~/local/src
git clone https://github.com/k0kubun/xremap.git ~/local/src/xremap
cd ~/local/src/xremap

cargo install xremap --features ${XDG_CURRENT_DESKTOP,,}

sudo usermod -aG input $USER

echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules
sudo udevadm trigger
sudo udevadm control --reload-rules

echo 'You need to enable the xremap extendion...'
xdg-open https://extensions.gnome.org/extension/5060/xremap/
