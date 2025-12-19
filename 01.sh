#!/bin/sh
ln -sf/usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "server"> /etc/hostname
echo "Please, enter a password for root"
passwd
useradd -m -G wheel -s /bin/bash bae
echo "Please, enter a password for bae"
passwd bae
EDITOR=vim visudo
systemctl enable NetworkManager
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Please, update your system"
su bae
umount -a
reboot
