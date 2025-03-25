#!/bin/bash

#if [[ $1 -eq "" ]];then exit 1;

SOURCE=$1

if ping -c 1 $SOURCE &> /dev/null;
then
    echo "This site looks good"
else
    echo "Site is not working"
fi