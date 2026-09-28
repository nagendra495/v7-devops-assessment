FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    openssh-server \
    sudo \
    curl \
    git \
    nginx \
    ufw \
    iproute2 \
    iputils-ping \
    net-tools \
    ca-certificates \
    openssl \
    iptables && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd


COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
