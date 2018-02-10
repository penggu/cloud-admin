#!/bin/bash

# Install shadowsocks on ubuntu 14.04
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y python-gevent python-pip python-m2crypto supervisor

sudo pip install shadowsocks

sudo mkdir -p touch /etc/shadowsocks
sudo cat > /etc/shadowsocks/shadowsocks.json <<EOF
{
  "server": "0.0.0.0",
  "server_port": 20444,
  "password": "***",
  "timeout": 300,
  "method": "rc4-md5"
}
EOF

sudo cat > /etc/supervisor/conf.d/shadowsocks.conf <<EOF
[program:shadowsocks]
command=/usr/local/bin/ssserver -c /etc/shadowsocks/shadowsocks.json
autorestart=true
user=nobody
EOF

invoke-rc.d supervisor restart

supervisorctl status

# Credit: https://gist.github.com/euyuil/55cfe14e6b3ba9ce416e
