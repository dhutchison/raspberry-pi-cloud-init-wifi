#!/bin/sh -e

cd "$(dirname "$0")"

source settings-public.sh
source settings-private.sh

eval "cat <<:"$'\n'"$(< user-data-template)"$'\n': > system-boot/cloud-init/user-data
