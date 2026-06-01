#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/1000
export WAYLAND_DISPLAY=wayland-1
export HYPRLAND_INSTANCE_SIGNATURE=$(cat /tmp/hypr-session)

for i in {10..0}
do
    hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 Shutting down in 15min..."
    sleep 0.2
done
sleep 298

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 10 more minutes left..."
sleep 300

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20  You have five more minutes left, you better start saving."
sleep 210

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 1 minute 30 seconds left!"
sleep 30

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 1 more minute left until shutdown. Save now, or else..."
sleep 30

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 30 seconds left."
sleep 10

hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 20 seconds left."
sleep 5

for i in {15..1}
do
    hyprctl notify 0 999 "rgb(ff0000)" "fontsize:20 $i                  "
    sleep 1
done

hyprctl notify 0 5000 "rgb(00FF00)" "Shutting down >:)..."
sleep 1
systemctl poweroff