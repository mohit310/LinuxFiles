#!/bin/bash
sudo reflector --sort rate -c US -f 10 -l 10 -n 100 -p http --save /etc/pacman.d/mirrorlist
