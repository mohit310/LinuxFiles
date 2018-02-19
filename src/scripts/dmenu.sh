#!/bin/bash
(cat ; (stest -flx $(echo $PATH | tr : ' ') | sort -u)) | dmenu_run -fn "xft:Ubuntu Mono:bold:pixelsize=14" -nb "#0f0f0f" -nf "#a6a6a6" -sb "#0f0f0f" -sf "#8f8fed" 
