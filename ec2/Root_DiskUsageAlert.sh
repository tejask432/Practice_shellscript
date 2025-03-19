#!/bin/bash

THERSHOLD=80
HOSTNAME=$(hostname)
EMAIL="dpt13054@gmail.com"
DATE=$(date)

#checking the disk usage
USAGE=$(df -h / | awk 'NR==2 {print $5}'| sed 's/%//g')

if [ $USAGE -gt $THERSHOLD ]; then
    echo "Alert:Disk usage on  $HOSTNAME  is $USAGE% as of $DATE" | mail -s "Disk Usage alert: $HOSTNAME -$USAGE%" $EMAIL 
else
    echo "Alert:Disk usage looks good"
fi