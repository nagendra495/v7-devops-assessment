# V7 AI Solutions – DevOps Technical Assessment

## Overview

Three Ubuntu VMs are simulated using Docker and configured with Ansible.

- vm1: Nginx Reverse Proxy + HTTPS
- vm2: Backend Nginx
- vm3: Backend Nginx
- Network: v7net (172.30.0.0/24)

## Architecture

```text
Client → HTTPS → vm1 (Nginx Reverse Proxy)
                       │
                 ┌─────┼─────┐
                 │     │     │
                /vm2  /vm3  /app
                 │     │     │
                vm2   vm3  vm2 + vm3
                           Load Balanced

vm1 → 172.30.0.11
vm2 → 172.30.0.12
vm3 → 172.30.0.13
```

## Security

- SSH key-only authentication
- Password and root login disabled
- Default DROP firewall
- Ansible passwordless sudo

## TLS & Domains

- public.vm1.local
- public.vm2.local
- public.vm3.local
- Self-signed TLS certificate on vm1
- HTTP redirects to HTTPS

## Ansible

ansible all -m ping

Ansible roles: common, ssh, nginx.
Second playbook run verified with changed=0 and failed=0.

## Load Balancing & Failover

/vm2 → vm2 | /vm3 → vm3 | /app → vm2 + vm3

When vm2 is stopped, /app continues through vm3. After restart, vm2 automatically rejoins.

## Project Structure

ansible.cfg | inventory.ini | docker/ | ansible/ | README.md

## Assumptions

Docker Desktop + WSL2 is used. .local domains are for the local assessment environment. Secrets and private keys are excluded from Git.
