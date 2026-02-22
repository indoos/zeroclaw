#!/bin/bash

echo "Stopping ZeroClaw..."
pkill -f "zeroclaw.*channel start" || true

echo "Starting ZeroClaw (No Build)..."
nohup ./target/debug/zeroclaw channel start > zeroclaw.log 2>&1 &

echo "ZeroClaw started. Logs are being written to zeroclaw.log."
