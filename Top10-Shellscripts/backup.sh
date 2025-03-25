#!/bin/bash


###########Author############
#Name: Tejas
#Date: 19-03-2025
#Description: this script used to take regular backup of application
#############################

APP_DIR="/home/ec2-user/myapp"
BACKUP_DIR="/home/ec2-user/backup"
CUR_TIME=$(date +%Y-%m-%d_%H-%M-%S)

#creating backup directory
mkdir -p $BACKUP_DIR/$CUR_TIME

#copying 
cp -r $APP_DIR $BACKUP_DIR/$CUR_TIME

echo "Backup completed on {$CUR_TIME}"