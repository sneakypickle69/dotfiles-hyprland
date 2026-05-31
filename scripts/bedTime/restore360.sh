#!/bin/bash

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export HYPRLAND_INSTANCE_SIGNATURE=$(cat /tmp/hypr-session)

HOUR=$(date +%H)
MIN=$(date +%M)

# convert current time to minutes since midnight
NOW=$((10#$HOUR * 60 + 10#$MIN))

# 02:30 → 150 minutes
# 06:00 → 360 minutes
START=135
END=360

if (( NOW < START || NOW >= END )); then
    # outside punishment window → restore 360Hz
    if ! grep -q "2560x1440@360" ~/.config/hypr/hyprland.lua; then
        sed -i 's/@[0-9]\+/@360/' ~/.config/hypr/hyprland.lua
        hyprctl reload
	hyprctl dispatch focusmonitor DP-3
        hyprctl notify 5 5000 "rgb(00ff00)" "fontsize:20 Good job, back at 360hz"
	fi
else
    # inside punishment window → do nothing (stay at 23Hz)
    hyprctl dispatch focusmonitor DP-3    
    hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 haha bro thought he could bypass it"
fi
