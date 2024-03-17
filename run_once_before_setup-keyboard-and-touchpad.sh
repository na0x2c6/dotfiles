#!/bin/bash
# see: https://github.com/k0kubun/xremap

set -Eeuv

if [[ $(uname -s) != "Linux" ]] ; then
    exit 0
fi

sudo dnf -y install rust cargo ruby cmake scdoc
sudo usermod -aG input $USER
echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules
sudo udevadm trigger
sudo udevadm control --reload-rules

mkdir -p ~/.local/share/gnome-shell/extensions
mkdir -p ~/local/src

# For Xremap
if [[ ! -e ~/.cargo/bin/xremap ]] ; then
    git clone https://github.com/k0kubun/xremap.git ~/local/src/xremap
    cd $_
    cargo install xremap --features ${XDG_CURRENT_DESKTOP,,}
fi

uuid="xremap@k0kubun.com"
if [[ ! -e ~/.local/share/gnome-shell/extensions/$uuid ]] ; then
    gdbus call --session \
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           "$uuid" || true
fi

# For 4 finger swipe
uuid="swap-finger-gestures-3-4@icedman.github.com"
if [[ ! -e ~/.local/share/gnome-shell/extensions/$uuid ]] ; then
    gdbus call --session \
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           "$uuid" || true
fi

# For ydotool
if ! which ydotool > /dev/null ; then
    git clone --filter=blob:none https://github.com/ReimuNotMoe/ydotool.git ~/local/src/ydotool
    cd $_
    mkdir -p build
    cd build
    cmake ..
    make -j $(nproc)
    sudo cp ydotool ydotoold /usr/local/bin/
    # Already managed by chezmoi but intentionally copied for updating
    cp ydotoold.service ~/.config/systemd/user/
fi

# For fusuma
if ! which fusuma > /dev/null ; then
    sudo gem install fusuma
    gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled
fi
