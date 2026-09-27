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

# Setup Systemd
## Remove systemd unwanted services
## Enable systemd required services
### flatpak preinstall
systemctl enable flatpak-preinstall.service
