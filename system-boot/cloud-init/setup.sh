#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

# Clean out the cloud-init items as no longer needed
apt-get -y purge\
 cloud-init cloud-guest-utils\
 cloud-initramfs-copymods cloud-initramfs-dyn-netconf\
 open-iscsi
rm -rf /etc/cloud/ /var/lib/cloud/

# Update packages, overwriting any configuration files
apt-get update

apt-get -y\
 -o Dpkg::Options::="--force-confdef"\
 -o Dpkg::Options::="--force-confold"\
 upgrade

# Install any packages in the configuration file
xargs --no-run-if-empty --arg-file=/boot/firmware/cloud-init/packages.txt apt-get install -y

# Cleanup
apt-get -y autoremove

echo "*** Setup complete ***"
