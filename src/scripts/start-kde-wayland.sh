if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ $XDG_SESSION_TYPE = tty ]]; then
  XDG_SESSION_TYPE=wayland exec dbus-run-session startplasmacompositor
fi
