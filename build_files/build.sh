#!/bin/bash

set -ouex pipefail

mkdir -p /var/roothome

echo "===Copying files==="

pacman -Syu --noconfirm rsync

rsync -rvK /ctx/system_files/shared/ /
rsync -rvK /ctx/system_files/gnome/ /

# Generate image-info.json
/ctx/build_files/shared/00-image-info.sh

# Enable extra repositories & install packages
/ctx/build_files/main/01-packages.sh

# Custom PKGBUILDs
/ctx/build_files/main/02-PKGBUILDs.sh

# systemd services, gschemas, etc
/ctx/build_files/main/03-config-services.sh

# Overrides
/ctx/build_files/main/04-overrides.sh

pacman -Rs --noconfirm rsync
