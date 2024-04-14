#!/bin/bash

# Function to check if a host/port is available
wait_for() {
    local host="$1"
    local port="$2"
    local max_attempts=30
    local attempt=1
    local result

    echo "Waiting for $host:$port to be available..."

    while [[ $attempt -le $max_attempts ]]; do
        if nc -z "$host" "$port"; then
            echo "Service $host:$port is available"
            return 0
        fi
        echo "Attempt $attempt: $host:$port is not available yet, retrying..."
        sleep 5
        ((attempt++))
    done

    echo "Failed to connect to $host:$port after $max_attempts attempts"
    return 1
}

# Wait for service_a to be available
wait_for "producing" "8080"

# Start your application
echo "Starting your application..."
# Your application startup command goes here
