
# Grab the details of the user running the script
USER="$(id -un)"
NAME="$(git config --get user.name)"
SSH_ID_RSA_PUB="$(< $HOME/.ssh/id_rsa.pub)"


# Load the timezone. 
# There are many ways to do this it seems. 
if [ -f /etc/timezone ]; then
  # If a file contains the timezone
  TIMEZONE=`cat /etc/timezone`
elif [ -h /etc/localtime ]; then
  # If the localtime file is a symlink
  TIMEZONE=$(readlink /etc/localtime | sed -e "s/.*\/zoneinfo\///")
fi
