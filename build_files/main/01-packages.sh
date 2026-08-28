#!/bin/bash

set -ouex pipefail


echo "===Installing packages==="


echo "==Installing base packages=="
pacman -Syu --noconfirm \
  crun \
  cups \
  evolution-data-server \
  firewalld \
  fprintd \
  fwupd \
  git \
  glibc-locales \
  gst-plugin-pipewire \
  intel-lpmd \
  ipp-usb \
  iwd \
  less \
  networkmanager \
  plymouth \
  pipewire \
  pipewire-alsa \
  pipewire-jack \
  pipewire-pulse \
  podman \
  power-profiles-daemon \
  thermald \
  udisks2-btrfs \
  udisks2-lvm2 \
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

echo "==Installing extra GNOME apps=="
# Certain essential apps that are not part of GNOME Core
pacman -Syu --noconfirm \
  bazaar \
  ptyxis

echo "==Installing extra packages=="
# Extra packages that aren't necessary for core system functionality
pacman -Syu --noconfirm \
  bat \
  chezmoi \
  distrobox \
  eza \
  fastfetch \
  fd \
  fish \
  micro \
  nvtop \
  ripgrep \
  starship \
  tealdeer \
  toolbox \
  zoxide
