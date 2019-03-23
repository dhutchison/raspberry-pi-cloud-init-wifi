USER="$(id -un)"
NAME="$(git config --get user.name)"
SSH_ID_RSA_PUB="$(< $HOME/.ssh/id_rsa.pub)"

HOSTNAME=pi
TIMEZONE=Europe/Stockholm
WIFI_REGDOMAIN=SE
