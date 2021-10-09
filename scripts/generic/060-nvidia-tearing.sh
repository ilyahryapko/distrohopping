#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo 'Appending options nvidia-drm modeset=1 to nvidia-graphics-drivers.conf'
echo 'options nvidia-drm modeset=1' >> /lib/modprobe.d/nvidia-graphics-drivers.conf

echo 'Updating initramfs'

update-initramfs -u
