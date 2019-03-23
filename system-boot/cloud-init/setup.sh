#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

apt-get -y purge\
 cloud-init cloud-guest-utils\
 cloud-initramfs-copymods cloud-initramfs-dyn-netconf\
 open-iscsi
rm -rf /etc/cloud/ /var/lib/cloud/

apt-get update

apt-get -y\
 -o Dpkg::Options::="--force-confdef"\
 -o Dpkg::Options::="--force-confold"\
 upgrade

apt-get -y install\
 docker.io docker-doc\
 emacs\
 gnuplot\
 gparted\
 language-pack-sv-base\
 libc6:armhf libstdc++6:armhf\
 lxterminal\
 usbmount

# Workaround for usbmount bug on Bionic
mkdir -p /etc/systemd/system/systemd-udevd.service.d
echo "[Service]\nMountFlags=shared\n" >\
 /etc/systemd/system/systemd-udevd.service.d/override.conf
systemctl daemon-reload
service systemd-udevd --full-restart

echo "*** Setup complete ***"
