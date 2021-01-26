#!/bin/sh
export SSH_AUTH_SOCK=/run/user/${UID}/keyring/ssh
XDG_SESSION_TYPE=wayland dbus-run-session gnome-session 1>~/Documents/gnome.log 2>&1

