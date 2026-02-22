#!/bin/bash

# Configuration
LOG_FILE="zeroclaw.log"
PID_FILE="zeroclaw.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p $PID > /dev/null; then
        echo "ZeroClaw is already running with PID $PID."
        exit 1
    else
        echo "Found stale PID file. Cleaning up."
        rm "$PID_FILE"
    fi
fi

echo "Starting ZeroClaw channel..."
nohup zeroclaw channel start > "$LOG_FILE" 2>&1 &
PID=$!
echo $PID > "$PID_FILE"

echo "ZeroClaw started with PID $PID. Logs are being written to $LOG_FILE."
