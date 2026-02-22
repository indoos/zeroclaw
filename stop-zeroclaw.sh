#!/bin/bash

# Configuration
PID_FILE="zeroclaw.pid"

if [ ! -f "$PID_FILE" ]; then
    echo "ZeroClaw pid file not found. Is it running?"
    exit 1
fi

PID=$(cat "$PID_FILE")

if ps -p $PID > /dev/null; then
    echo "Stopping ZeroClaw (PID $PID)..."
    kill $PID
    sleep 2
    if ps -p $PID > /dev/null; then
        echo "Process did not stop gracefully. Forcing kill..."
        kill -9 $PID
    fi
    echo "ZeroClaw stopped."
else
    echo "Process $PID is not running."
fi

rm -f "$PID_FILE"
