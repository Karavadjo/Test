#!/bin/bash

yum info haproxy
yum install gcc pcre-devel tar make -y
cd /tmp
wget http://www.haproxy.org/download/2.0/src/haproxy-2.0.7.tar.gz -O ~/haproxy.tar.gz  
tar xzvf ~/haproxy.tar.gz -C ~/
cd ~/haproxy-2.0.7
make TARGET=linux-glibc
sudo make install
sudo mkdir -p /etc/haproxy
sudo mkdir -p /var/lib/haproxy 
sudo touch /var/lib/haproxy/stats
sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy


sudo cp ~/haproxy-2.0.7/examples/haproxy.init /etc/init.d/haproxy
sudo chmod 755 /etc/init.d/haproxy
sudo systemctl daemon-reload

sudo chkconfig haproxy on

sudo useradd -r haproxy
haproxy -v
