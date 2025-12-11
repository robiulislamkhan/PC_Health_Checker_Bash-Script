#!/bin/bash

while true; do
    # Get CPU model
    cpu_model=$(lscpu | grep "Model name" | sed 's/Model name:\s*//')

    # Get RAM size in GB
    ram_size=$(free -g | grep Mem | awk '{print $2}')

    # Get total storage in GB
    storage_size=$(df -h / | grep / | awk '{print $2}' | sed 's/G//')

    # Get CPU usage percentage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    # Get RAM usage percentage
    ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    # Get storage usage and free space in GB
    storage_used=$(df -h / | grep / | awk '{print $3}' | sed 's/G//')
    storage_free=$(df -h / | grep / | awk '{print $4}' | sed 's/G//')

    # Display the PC Health Information
    clear
    echo "==================== PC Health Checker ===================="
    echo "CPU Model: $cpu_model"
    echo "RAM Size: ${ram_size}GB"
    echo "Total Storage: ${storage_size}GB"
    echo "---------------------------------"
    echo "CPU Usage: ${cpu_usage}%"
    echo "RAM Usage: ${ram_usage}%"
    echo "Storage Used: ${storage_used}GB"
    echo "Storage Free: ${storage_free}GB"
    echo "---------------------------------"

    # Alert for CPU Usage > 50%
    if (( $(echo "$cpu_usage > 50" | bc -l) )); then
        echo "ALERT: CPU usage is above 50%! ($cpu_usage%)"
    fi

    # Alert for RAM Usage > 50%
    if (( $(echo "$ram_usage > 50" | bc -l) )); then
        echo "ALERT: RAM usage is above 50%! ($ram_usage%)"
    fi

    echo "----------------------------------------------------------"
    echo "Rechecking in 50 seconds..."
    sleep 50
done
