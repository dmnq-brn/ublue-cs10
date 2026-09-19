#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages
/ctx/install-packages.sh

### add flatpak flathub remote repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

rm /usr/share/gnome-initial-setup/initial-setup-dconf-defaults
