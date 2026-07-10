#!/bin/bash

options="󰐥 Shutdown\n󰜉 Reboot\n󰒲 Suspend\n󰍃 Logout\n󰌾 Lock"

chosen=$(echo -e "$options" | rofi \
    -dmenu \
    -i \
    -p "Power" \
    -click-to-exit)

case "$chosen" in
    *Shutdown)
        systemctl poweroff
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Logout)
        swaymsg exit
        ;;
    *Lock)
        swaylock
        ;;
esac
