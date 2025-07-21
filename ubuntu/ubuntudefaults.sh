#!/bin/sh

# Drivers
sudo ubuntu-drivers install

# Settings
snap set core snapshots.automatic.retention=no

# Fonts
echo "setting fonts..."
gsettings set org.gnome.desktop.interface font-name 'Noto sans'
gsettings set org.gnome.desktop.interface document-font-name 'Noto sans'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace'
