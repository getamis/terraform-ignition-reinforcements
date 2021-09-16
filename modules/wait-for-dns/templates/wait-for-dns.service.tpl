[Unit]
Description=Wait for DNS and hostname
Before=kubelet.service

[Service]
Type=oneshot
RemainAfterExit=true
ExecStartPre=/bin/sh -c 'while [ `hostname -s` == "localhost" ]; do sleep 1; done;'
ExecStart=/bin/sh -c 'while ! /usr/bin/grep '^[^#[:space:]]' /etc/resolv.conf > /dev/null; do sleep 1; done'

[Install]
RequiredBy=${required_service}