#!/bin/bash

#######################
# NAME: Tejas
# Date: 19-3-2025
# Description: Script will alert if any disk usage is more than 85%
######################


THERSHOLD=85
HOSTNAME=$(hostname)
EMAIL="dpt13054@gmail.com"
DATE=$(date)

#checking the disk usage
df -h | grep -vE "^Filesystem|tmpfs|cdrom" | awk '{print $1" "$5}' | while read output;
do
USAGE=$(echo $output | awk '{print $2}' | cut -d'%' -f1)
PARTITION=$(echo $output | awk '{print $1}' )
if [ $USAGE -gt $THERSHOLD ]; then
    echo "ALERT:HIgh Disk usage on $HOSTNAME- $PARTITION Usage $USAGE% as of $DATE" #| mail -s "Disk Usage alert: $HOSTNAME -$USAGE%" $EMAIL 
else
    echo "INFO:Disk usage looks good-$HOSTNAME:$PARTITION"
fi
done