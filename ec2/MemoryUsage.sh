#!/bin/bash

THERSHOLD=80
HOSTNAME=$(hostname)
EMAIL="dpt13054@gmail.com"
DATE=$(date)

USAGE=$(free -h | grep Mem | awk '{print $3/$2 * 100}'| awk '{print int($1+0.5)}')

if [ $USAGE -gt $THERSHOLD ]; then
    echo "Memory usage alert: $HOSTNAME -$USAGE" | mail -s "Alert-High Memory usage on -$HOSTNAME" $EMAIL
else
    echo "Memory usage is Good"
fi