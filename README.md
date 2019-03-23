# Raspberry Pi Cloud-Init for WiFi

Cloud-init is used for setting up an Ubuntu server installation with WiFi on
a Raspberry Pi. It works without Ethernet cable by copying setup files to an
SD card with a freshly written image.

This project is tested with
`ubuntu-18.04.2-preinstalled-server-arm64+raspi3.img.xz`
downloaded from https://wiki.ubuntu.com/ARM/RaspberryPi.

## Script preparations

* Customize time zone and hostname in [settings-public.sh]().
* Create the file `settings-private.sh` to set up shell-variables as shown in
  [settings-private-dummy.sh]().
* Customize the WiFi configuration in [user-data-template]() if needed.
* Remove the argument `ipv6.disable=1` from [system-boot/cmdline.txt]() if
  you have a network connection that can use ipv6.
* Customize the package selection in [system-boot/cloud-init/setup.sh]().

## Setup procedure

* Run the script [config.sh]() and check the output in
  `system-boot/cloud-init/user-data`.
* Write the Ubuntu server image to an SD card.
* Copy the contents of [system-boot/]() to the newly created boot partition
  on the SD card.
* Boot the Raspberry Pi with the SD card.
