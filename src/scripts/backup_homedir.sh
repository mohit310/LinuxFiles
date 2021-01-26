#!/bin/sh

rsync -av -delete --exclude-from $HOME/bin/rsync-exclude.txt $HOME/ ~/shares/1tbdisk/linux_backup/mkarch/
sudo rsync -av -delete /etc ~/shares/1tbdisk/linux_backup/mkarch/

