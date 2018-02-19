#export SSH_AUTH_SOCK
#exec cinnamon-session
#exec startkde
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96
#exec dbus-launch --exit-with-session gnome-session
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

xdg-user-dirs-update &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)


xrdb ~/.Xresources
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startkde;;
    xfce|xfce4        ) exec startxfce4;;
    gnome		      ) exec gnome;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
