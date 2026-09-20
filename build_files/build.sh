#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages
/ctx/install-packages.sh

### add flatpak flathub remote repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

### install flatpack app
flatpak install -y --noninteractive --system flathub com.mattjakeman.ExtensionManager
flatpak install -y --noninteractive --system flathub page.tesk.Refine
flatpak install -y --noninteractive --system flathub net.nokyan.Resources
flatpak install -y --noninteractive --system org.mozilla.firefox

### remove gnome-initial-setup defaults configuration
rm /usr/share/dconf/profile/gnome-initial-setup
rm /usr/share/gnome-initial-setup/initial-setup-dconf-defaults
rm /usr/share/gnome-initial-setup/vendor.conf
