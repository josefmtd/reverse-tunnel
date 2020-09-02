include .env

.PHONY: install
install:
		mkdir /opt/reverse
		cp ./reverse-tunnel.service /etc/systemd/system/reverse-tunnel.service
		cp "./key/${TUNNEL_KEY_NAME}" "/opt/reverse/${TUNNEL_KEY_NAME}"
		chmod 400 "/opt/reverse/${TUNNEL_KEY_NAME}"
		sed -i 's|$$PORT|'${TUNNEL_PORT}'|g' "/etc/systemd/system/reverse-tunnel.service"
		sed -i 's|$$USER|'${TUNNEL_USER}'|g' "/etc/systemd/system/reverse-tunnel.service"
		sed -i 's|$$HOST|'${TUNNEL_HOST}'|g' "/etc/systemd/system/reverse-tunnel.service"
		sed -i 's|$$PATH_TO_KEY|/opt/reverse/'${TUNNEL_KEY_NAME}'|g' "/etc/systemd/system/reverse-tunnel.service"
		systemctl daemon-reload
		systemctl enable reverse-tunnel.service
		systemctl restart reverse-tunnel.service

.PHONY: clean
clean:
		systemctl stop reverse-tunnel.service
		systemctl disable reverse-tunnel.service
		rm -rf /opt/reverse
		rm /etc/systemd/system/reverse-tunnel.service
		systemctl daemon-reload
