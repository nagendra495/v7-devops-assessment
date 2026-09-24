#!/bin/bash
set -e

mkdir -p /run/sshd

nginx -t
service nginx start

exec /usr/sbin/sshd -D
