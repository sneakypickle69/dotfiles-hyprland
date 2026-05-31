#!/bin/bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export HYPRLAND_INSTANCE_SIGNATURE=$(cat /tmp/hypr-session)

for ((i = 0 ; i < 10 ; i++ ))
do
  hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 Go to bed now or else..."
  sleep 0.2
done
sleep 298
hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 10 more minutes left..."
sleep 300
hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:20 5 more minutes... >:)"
sleep 297
hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 ok, im warning you... 3"
sleep 1
hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 2                      "
sleep 1
hyprctl notify 0 3000 "rgb(ff0000)" "fontsize:20 1                      "
sleep 1
hyprctl notify 0 5000 "rgb(ff0000)" "fontsize:60 ok, you wanted this >;)"
sed -i 's/2560x1440@[0-9]\+/2560x1440@23/' ~/.config/hypr/hyprland.lua
hyprctl reload
