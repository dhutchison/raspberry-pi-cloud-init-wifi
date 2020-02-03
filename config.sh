#!/bin/sh -e

cd "$(dirname "$0")"

# Load information which can be determined about the current user. 
# This will get the SSH key and username/id, as well as the timezone
# from the current machine. 
. ./settings-public.sh


# Prompt for configuration values.

read -p 'Hostname: ' HOSTNAME

# password hash

# check is passlib is installed
python3 -m pip list | grep passlib 2>&1>/dev/null
if [ $? -ne 0 ]; then
    # passlib is not installed, install it
    python3 -m pip insall passlib
fi

# Generate a password hash
PASSWD=$(python3 -c 'from passlib.hash import sha512_crypt; import getpass; print(sha512_crypt.hash(getpass.getpass("Password for new user: ")))')


# Prompt for the WIFI details
read -p 'Wifi SSID: ' WIFI_SSID
read -sp 'Wifi Password: ' WIFI_PASSWD

eval "cat <<~
$(cat user-data-template)
~" > system-boot/cloud-init/user-data
