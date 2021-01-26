#!/bin/bash

#24: Default
#32: Medium
#48: Large
#64: Larger
#96: Largest

echo "Current cursor size:"`gsettings get org.gnome.desktop.interface cursor-size`
echo "Setting cursor to 32"
gsettings set org.gnome.desktop.interface cursor-size 32
