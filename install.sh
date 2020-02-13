#!/bin/bash

DIR=`pwd`

source "${DIR}/ssh.conf"

/bin/cp "${DIR}/reverse-tunnel.service" /etc/systemd/system/reverse-tunnel.service

PATH_TO_KEY="${DIR}/key/${KEY_NAME}"
sed -i 's|$PORT|'$PORT'|g' "/etc/systemd/system/reverse-tunnel.service"
sed -i 's|$USER|'$USER'|g' "/etc/systemd/system/reverse-tunnel.service"
sed -i 's|$HOST|'$HOST'|g' "/etc/systemd/system/reverse-tunnel.service"
sed -i 's|$PATH_TO_KEY|'$PATH_TO_KEY'|g' "/etc/systemd/system/reverse-tunnel.service"

/bin/systemctl daemon-reload
/bin/systemctl enable reverse-tunnel.service
