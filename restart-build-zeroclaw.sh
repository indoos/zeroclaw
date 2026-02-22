#!/bin/bash

echo "Stopping ZeroClaw..."
pkill -f "zeroclaw.*channel start" || true

echo "Building ZeroClaw with whatsapp-web feature..."
cargo build --features whatsapp-web

if [ $? -ne 0 ]; then
    echo "Build failed. Not starting ZeroClaw."
    exit 1
fi

echo "Starting ZeroClaw..."
nohup ./target/debug/zeroclaw channel start > zeroclaw.log 2>&1 &

echo "ZeroClaw started. Logs are being written to zeroclaw.log."
