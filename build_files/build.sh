#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages
/ctx/install-packages.sh

### remove gnome-initial-setup defaults configuration
rm /usr/share/dconf/profile/gnome-initial-setup
rm /usr/share/gnome-initial-setup/initial-setup-dconf-defaults
rm /usr/share/gnome-initial-setup/vendor.conf

### enable flatpak preinstall system Unit File
systemctl enable flatpak-preinstall.service
