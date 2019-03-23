#!/bin/sh -e

cd "$(dirname "$0")"

. ./settings-public.sh
. ./settings-private.sh

eval "cat <<~
$(cat user-data-template)
~" > system-boot/cloud-init/user-data
