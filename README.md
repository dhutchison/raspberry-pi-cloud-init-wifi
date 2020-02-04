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

* Customize the package selection in
  [system-boot/cloud-init/packages.txt](system-boot/cloud-init/packages.txt).

## Setup procedure

* Run the script [config.sh](config.sh), answering any prompts, and check the output in
  `system-boot/cloud-init/user-data`.
* Write the Ubuntu server image to an SD card.
* Copy the contents of [system-boot/](system-boot/) to the newly created boot
  partition on the SD card.
* Boot the Raspberry Pi with the SD card.
