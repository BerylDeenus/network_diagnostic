#!/usr/bin/bash

target="${1:-google.com}"
ip=$(hostname -I | awk '{print $1}')
gateway=$(ip route | grep default | awk '{print $3}')

if ping -c 1 8.8.8.8 &> /dev/null; then
    internet="OK"
else
    internet="FAILED"
fi

if ping -c 1 "$target" &> /dev/null; then
    dns="OK"
else
    dns="FAILED"
fi

if curl -sI "https://$target" &> /dev/null; then
    https="OK"
else
    https="FAILED"
fi

echo "=== Network Diagnostic ==="
echo "Local IP: $ip"
echo "Gateway:  $gateway"
echo "Internet: $internet"
echo "DNS:      $dns"
echo "HTTPS:    $https"
