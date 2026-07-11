#!/usr/bin/env bash

LAPTOP="eDP-1"

EXTERNALS=($(swaymsg -t get_outputs -r \
    | jq -r --arg laptop "$LAPTOP" '.[] | select(.name != $laptop) | .name'))

[ ${#EXTERNALS[@]} -eq 0 ] && {
    notify-send "No external monitor connected"
    exit
}

# If multiple external monitors exist, use the first one (same behavior as before)
EXTERNAL="${EXTERNALS[0]}"

choice=$(printf \
"💻 Laptop only (%s)\n🖥 External only (%s)\n🖥🖥 Both (%s + %s)\n" \
"$LAPTOP" "$EXTERNAL" "$LAPTOP" "$EXTERNAL" |
rofi -dmenu -i -p "Projection")

case "$choice" in
    "💻 Laptop only ($LAPTOP)")
        swaymsg output "$LAPTOP" enable
        swaymsg output "$EXTERNAL" disable
        ;;

    "🖥 External only ($EXTERNAL)")
        swaymsg output "$LAPTOP" disable
        swaymsg output "$EXTERNAL" enable
        ;;

    "🖥🖥 Both ($LAPTOP + $EXTERNAL)")
        swaymsg output "$LAPTOP" enable
        swaymsg output "$EXTERNAL" enable
        ;;
esac
