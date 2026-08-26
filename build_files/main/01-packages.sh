#!/bin/bash

set -ouex pipefail


echo "===Installing packages==="


echo "==Installing GNOME desktop=="
# GNOME Packages
pacman -Syu --noconfirm \
  gdm \
  gnome-backgrounds \
  gnome-color-manager \
  gnome-control-center \
  gnome-disk-utility \
  gnome-initial-setup \
  gnome-keyring \
  gnome-remote-desktop \
  gnome-session \
  gnome-settings-daemon \
  gnome-shell \
  gnome-tour \
  gnome-user-docs \
  gnome-user-share \
  grilo-plugins \
  gst-thumbnailers \
  gvfs \
  gvfs-afc \
  gvfs-dnssd \
  gvfs-goa \
  gvfs-gphoto2 \
  gvfs-mtp \
  gvfs-nfs \
  gvfs-smb \
  gvfs-wsdd \
  malcontent \
  nautilus \
  orca \
  rygel \
  tecla \
  xdg-desktop-portal-gnome \
  xdg-user-dirs-gtk \
  yelp

echo "==Installing supporting packages for GNOME=="
# Complementary packages for GNOME desktop functionality
pacman -Syu --noconfirm \
  bazaar \
  fprintd \
  power-profiles-daemon

echo "==Installing extra packages=="
# Extra packages
pacman -Syu --noconfirm \
  fastfetch \
  fish \
  iwd \
  intel-lpmd \
  micro \
  nvtop \
  thermald
