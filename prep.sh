#!/usr/bin/env bash
set -e


cat > /etc/dnsmasq-private.conf <<END_OF_PRIVATE_CONFIG
# DNSMasq private Config

interface=wl_private

address=/protonet/10.42.0.1
address=/$(hostname)/10.42.0.1

dhcp-range=wl_private,10.42.0.10,10.42.255.250,24h

# Gateway
dhcp-option=3,10.42.0.1

# DNS
dhcp-option=6,10.42.0.1

# IP Forward (no)
dhcp-option=19,0

# Source Routing
dhcp-option=20,0

# 44-47 NetBIOS
dhcp-option=44,0.0.0.0
dhcp-option=45,0.0.0.0
dhcp-option=46,8
dhcp-option=47

dhcp-authoritative

bind-interfaces
except-interface=lo
END_OF_PRIVATE_CONFIG

cat > /etc/dnsmasq-public.conf <<END_OF_PUBLIC_CONFIG
# DNSMasq public Config

interface=wl_public

address=/protonet/10.43.0.1
address=/$(hostname)/10.43.0.1

dhcp-range=wl_public,10.43.0.10,10.43.255.250,24h

# Gateway
dhcp-option=3,10.43.0.1

# DNS
dhcp-option=6,10.43.0.1

# IP Forward (no)
dhcp-option=19,0

# Source Routing
dhcp-option=20,0

# 44-47 NetBIOS
dhcp-option=44,0.0.0.0
dhcp-option=45,0.0.0.0
dhcp-option=46,8
dhcp-option=47

dhcp-authoritative

bind-interfaces
except-interface=lo
END_OF_PUBLIC_CONFIG


exec "$@"