#!/bin/sh
loadkeys br-abnt2
pacman-key --init
pacman-key --populate
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mount /dev/sda3 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
pacstrap /mnt base base-devel linux linux-firmware sof-firmware grub vim networkmanager
genfstab /mnt > /mnt/etc/fstab
