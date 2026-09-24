#!/bin/bash
set -e

SUBNET="172.30.0.0/24"

iptables -F INPUT
iptables -P INPUT DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -s "$SUBNET" -j ACCEPT

if [ "$(hostname)" = "vm1" ]; then
    iptables -A INPUT -p tcp --dport 80 -s "$SUBNET" -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -s "$SUBNET" -j ACCEPT
else
    iptables -A INPUT -p tcp --dport 80 -s "$SUBNET" -j ACCEPT
fi

touch /etc/v7-firewall-applied
