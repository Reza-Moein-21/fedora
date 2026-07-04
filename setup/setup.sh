#!/usr/bin/env bash

set -euo pipefail

echo "Updating system..."

sudo dnf update --refresh -y



echo "Setup extra repos"
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable dejan/lazygit -y
sudo dnf copr enable atim/starship -y

echo "Installing packages..."

packages=(
    # System Tools & Shell Enhancements
#    base-devel     uwsm libnewt  
    # dunst pipewire wireplumber udisks2 udiskie
    zsh eza bat fd fzf zoxide ripgrep stow  fontconfig tmux remmina 
    ntfs-3g btop bash-completion zip unzip unrar wl-clipboard
    less zsh zsh-autosuggestions zsh-syntax-highlighting
    alacritty starship persepolis kanshi
#    # ghostty ghostty-nautilus
#
#    # GNOME Desktop
     xdg-desktop-portal-gtk gvfs gtk3 gtk4 glib2
     gnome-keyring
#
#    # Themes
     pop-gtk3-theme pop-gtk4-theme pop-icon-theme 
     # nwg-look
#
#    # Graphics
#    nvidia-dkms linux-headers nvidia-utils intel-media-driver
#
#    # Hyprland
#    hyprlock hypridle hyprpaper brightnessctl xdg-desktop-portal-hyprland
#
#    # Networking
#    networkmanager networkmanager-openconnect openconnect tor
#
    # Multimedia
     mpv celluloid chromium waybar loupe ffmpeg
    # photoflare
#
#    # Docker
#    docker docker-compose lazydocker
#
#    # Development
#    base-devel lldb gdb pkgconf cmake rust rust-analyzer ollama 
     git gh lazygit neovim nodejs npm 
)

sudo dnf install -y "${packages[@]}"

echo "Installing nvm(Node version manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

echo "Install SDKMan"
curl -s "https://get.sdkman.io" | bash

echo "Running post-install scripts..."

source ./_rust-setup.sh
source ./_sdkman-setup.sh
source ./_nvm-setup.sh
# source ./nopass-openconnect.sh
# source ./defaults-mime.sh
# source ./docker-setup.sh
source ./_zsh-setup.sh

echo "Done."
