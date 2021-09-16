[Unit]
Description = Systemd unit for fetching Prometheus Node Exporter
ConditionPathExists = !/opt/node-exporter.done
After = network-online.target
Wants = network-online.target
Before = node-exporter.service

[Service]
Type = oneshot
RemainAfterExit = true

User = root
Group = root

ExecStartPre = /usr/bin/mkdir -p /opt
ExecStartPre = /usr/bin/curl -L -s -o /opt/node_exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v${version}/node_exporter-${version}.linux-amd64.tar.gz
ExecStartPre = /usr/bin/tar zxf /opt/node_exporter.tar.gz -C /opt/
ExecStartPre = /usr/bin/cp /opt/node_exporter-${version}.linux-amd64/node_exporter /usr/local/bin/
ExecStart = /usr/bin/chmod 755 /usr/local/bin/node_exporter
ExecStartPost = /bin/touch /opt/node-exporter.done
ExecStartPost = /usr/bin/rm /opt/node_exporter.tar.gz
ExecStartPost = /usr/bin/rm -r /opt/node_exporter-${version}.linux-amd64

[Install]
WantedBy = multi-user.target
RequiredBy = node-exporter.service
