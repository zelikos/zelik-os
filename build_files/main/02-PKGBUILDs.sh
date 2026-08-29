#!/bin/bash

set -ouex pipefail


echo "===Building and installing custom packages==="

pacman -Syu --noconfirm base-devel
mkdir /tmp/packages/ && cp -r /ctx/build_files/packages/ /tmp/pkgbuilds/

# Add build user to run makepkg, as makepkg cannot be run as root
useradd --no-create-home --shell=/bin/false build && usermod -L build
echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers.d/build-pacman
chown -Rc build /tmp/pkgbuilds

# makepkg -srfci
# -s: Installs required dependencies for PKGBUILD
# -r: Removes build dependencies after successful build
# -f: Overwrites any existing package in directory
# -c: Cleans up work files after build
# -i: Installs package after successful build

# xdg-terminal-exec https://github.com/Vladimir-csp/xdg-terminal-exec/
runuser -u build -- makepkg -srfci --noconfirm -D /tmp/pkgbuilds/xdg-terminal-exec

# Cleanup
userdel build
rm /etc/sudoers.d/build-pacman
pacman -Rs --noconfirm base-devel
