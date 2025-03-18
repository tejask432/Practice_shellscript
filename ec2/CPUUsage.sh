#!/bin/bash

# Set the threshold for CPU usage (percentage)
THRESHOLD=80

# Email details
EMAIL="dpt13054@gmail.com"
SUBJECT="High CPU Usage Alert"
LOGFILE="/var/log/cpu_alert.log"

#Used to Stress the cpu for testing 
# yes > /dev/null &


# Function to get current CPU usage
get_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'
}

# Log and alert when CPU usage is high
check_and_alert() {
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    CPU_USAGE=$(get_cpu_usage)

    # Compare CPU usage with the threshold
    if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
        # Log the event
        echo "$TIMESTAMP - ALERT: CPU usage is $CPU_USAGE%, exceeding $THRESHOLD%" >> $LOGFILE
        
        # Send an alert email
        echo "CPU Usage Alert: The current CPU usage is $CPU_USAGE%, which exceeds the threshold of $THRESHOLD%." | mail -s "$SUBJECT" $EMAIL
    else
        # Log normal usage
        echo "$TIMESTAMP - INFO: CPU usage is $CPU_USAGE%, within normal range." >> $LOGFILE
    fi
}

# Run the check and alert function
check_and_alert
