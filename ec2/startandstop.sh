#!/bin/bash

###################### AUTHOR #######################
#Name: Tejas
#Date: 11-03-2025
#Version: v1

#set -x         # Debug mode
set -e          # It makes the script exit immediately if any command within the script fails
set -o pipefail # improve error handling when working with pipelines

#checking the for empty argument
if [ $# != 2 ]; then
    echo "Please provide 2 Arguments [Instance state & Instance ID]"
    exit 1
fi

#accepting cmdline argument
IDSTATE=$1
INSTANCE_ID=$2
AWS_REGION="us-east-1"


#EC2 Start function
fn_start_Instance(){
    if [[ $status != "running" ]]; then
        echo "Starting EC2 instance"
        aws ec2 start-instances --instance-ids $INSTANCE_ID --region $AWS_REGION
        sleep 10
        status=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].State.Name" --output text)
        echo "$INSTANCE_ID instance is- $status"
    else
        echo "$INSTANCE_ID -instance is already running";
    fi
}

#EC2 Start function
fn_stop_Intance(){
    if [[ $status != "stopped" ]]; then
        echo "stoping the instance"
        aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $AWS_REGION
        sleep 10
        status=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].State.Name" --output text)
        echo "$INSTANCE_ID instance is- $status"
    else
        echo "$INSTANCE_ID -instance is already stopped";
    fi
}

#EC2 instance status
status=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].State.Name" --output text)
echo "Current status of Instance- $status"


if [[ $IDSTATE == "start" ]]; then
    fn_start_Instance
elif [[ $IDSTATE == "stop" ]]; then
    fn_stop_Intance
else
    echo "Invalid: Provide a Valid State {start|stop}"
    exit 1;
fi