function __message {
    echo $@ > /dev/stderr
}

function __install_remote_gnome_extension {
    local uuid="$1"
    if [[ -e ~/.local/share/gnome-shell/extensions/$uuid ]] ; then
        __message "skip, already exists: ~/.local/share/gnome-shell/extensions/$uuid"
        return
    fi
    gdbus call --session \
           --dest org.gnome.Shell.Extensions \
           --object-path /org/gnome/Shell/Extensions \
           --method org.gnome.Shell.Extensions.InstallRemoteExtension \
           "$uuid" || true

    while [[ ! -e ~/.local/share/gnome-shell/extensions/$uuid ]] ; do
        __message "waiting ..."
        sleep 1
    done
}
