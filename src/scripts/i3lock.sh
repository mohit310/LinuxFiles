#!/bin/bash

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s

BLURTYPE="2x8" # 2.90s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -resize 50%
convert $IMAGE -blur $BLURTYPE $IMAGE
convert $IMAGE -resize 200%
i3lock -i $IMAGE
rm $IMAGE
