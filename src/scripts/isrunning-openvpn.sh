#!/bin/bash

FILE=/proc/sys/net/ipv4/conf/tun0
if [ -d "$FILE" ]; then
    echo "%{u#0000ff}VPN:On%{u-}"
else
    echo "%{F#f00}VPN:Off%{F-}"
fi
