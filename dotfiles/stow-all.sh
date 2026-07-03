#!/usr/bin/env bash

echo "Stow all dotfile in current directory"

stow -t "$HOME" -R */

echo "All Done." 
