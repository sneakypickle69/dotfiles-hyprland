#!/bin/bash

WALLPAPER=$(hyprctl hyprpaper listactive | awk '{print $NF}' | head -1)

# Run pywal
command wal -i "$WALLPAPER"

# Source the generated colorscheme
source ~/.cache/wal/colors.sh

# Update cava gradient colors
sed -i "s/gradient_color_1 = .*/gradient_color_1 = '$color1'/" ~/.config/cava/config
sed -i "s/gradient_color_2 = .*/gradient_color_2 = '$color2'/" ~/.config/cava/config
sed -i "s/gradient_color_3 = .*/gradient_color_3 = '$color3'/" ~/.config/cava/config
sed -i "s/gradient_color_4 = .*/gradient_color_4 = '$color4'/" ~/.config/cava/config
sed -i "s/gradient_color_5 = .*/gradient_color_5 = '$color5'/" ~/.config/cava/config
sed -i "s/gradient_color_6 = .*/gradient_color_6 = '$color6'/" ~/.config/cava/config

# Copy wallpaper to active path
ext="${WALLPAPER##*.}"
cp "$WALLPAPER" ~/Pictures/wallpapers/active.$ext
cp "$WALLPAPER" ~/.config/librewolf/librewolf/mrtdkvwz.default-default/wallpaper/e4114f7f-78e3-4d91-bbec-84c2d0ed9944

# Update hyprlock layout
sed -i "s|path = .*active.*|path = $HOME/Pictures/wallpapers/active.$ext|" ~/.config/hyprlock/layouts/layout9.conf

# Reload hyprland
hyprctl reload