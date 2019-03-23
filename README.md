# Raspberry Pi Cloud-Init for WiFi

Cloud-init is used for setting up an Ubuntu server installation with WiFi on
a Raspberry Pi. It works without Ethernet cable by copying setup files to an
SD card with a freshly written image.

This project is tested with
`ubuntu-18.04.2-preinstalled-server-arm64+raspi3.img.xz`
downloaded from https://wiki.ubuntu.com/ARM/RaspberryPi.

The scripts set up cloud-init using the boot partition on the installation SD
card as a NoCloud datasource. A user account with key-authorized SSH login is
prepared for the user running the config script.

## Script preparations

* Customize time zone, hostname, and WiFi country code in
  [settings-public.sh](settings-public.sh).
* Create the file `settings-private.sh` to set up shell-variables as shown in
  [settings-private-dummy.sh](settings-private-dummy.sh).
* Customize the WiFi configuration in [user-data-template](user-data-template)
  if needed.
* Remove the argument `ipv6.disable=1` from
  [system-boot/cmdline.txt](system-boot/cmdline.txt) if you have a network
  connection that can use ipv6.
* Customize the package selection in
  [system-boot/cloud-init/setup.sh](system-boot/cloud-init/setup.sh).

## Setup procedure

* Run the script [config.sh](config.sh) and check the output in
  `system-boot/cloud-init/user-data`.
* Write the Ubuntu server image to an SD card.
* Copy the contents of [system-boot/](system-boot/) to the newly created boot
  partition on the SD card.
* Boot the Raspberry Pi with the SD card.
