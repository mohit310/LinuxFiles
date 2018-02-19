#!/bin/bash
sudo /usr/bin/iw dev wlp8s0 set power_save off
sudo iwconfig wlp8s0 txpower 30
