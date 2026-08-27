#!/bin/bash

set -ouex pipefail


echo "===Installing packages==="


echo "==Installing base packages=="
pacman -Syu --noconfirm \
  crun \
  git \
  gst-plugin-pipewire \
  less \
  plymouth \
  pipewire \
  pipewire-alsa \
  pipewire-jack \
  pipewire-pulse \
  podman \
  vulkan-intel \
  vulkan-radeon \
  wireplumber

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
# and certain essential apps not part of GNOME Core
pacman -Syu --noconfirm \
  bazaar \
  fprintd \
  fwupd \
  networkmanager \
  power-profiles-daemon \
  ptyxis \
  system-config-printer

echo "==Installing extra packages=="
# Extra packages
pacman -Syu --noconfirm \
  chezmoi \
  distrobox \
  fastfetch \
  fish \
  iwd \
  intel-lpmd \
  micro \
  nvtop \
  thermald \
  toolbox
