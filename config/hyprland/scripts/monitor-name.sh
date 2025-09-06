#!/bin/bash
MONITOR=$(hyprctl monitors | grep Monitor | awk '{print $2}')
notify-send "Monitor: $MONITOR"