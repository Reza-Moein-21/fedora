#!/usr/bin/env bash
set -e

gsettings set org.gnome.desktop.interface gtk-theme 'Pop-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Pop'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface font-name 'Sans 10'
