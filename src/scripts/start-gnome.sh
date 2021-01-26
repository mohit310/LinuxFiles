if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ $XDG_SESSION_TYPE = tty ]]; then
   QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
fi

dbus-update-activation-environment --systemd DISPLAY

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
