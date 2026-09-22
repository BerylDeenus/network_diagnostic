#!/usr/bin/bash
ip=$(hostname -I)
gateway=$(ip route | grep default | awk {'$3'})
target="${1:-google.com}"
if ping -c 1 {"$target"} &> /dev/null ; then
        internet="ok"
else
        internet="failed"
fi
if ping  -c 1 "{$target}" &> /dev/null ; then
        DNS="ok"
else
        DNS="failed"
fi  
if curl -I "{$target}" &> /dev/null ; then
        HTTPS="ok"
else
        HTTPS="failed"
fi 
