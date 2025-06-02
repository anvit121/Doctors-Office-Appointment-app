#!/bin/bash

# Get the backend service URL
BACKEND_URL="<BACKEND URL>"

# Function to send requests
send_requests() {
    while true
    do
        curl -X POST \
        http://${BACKEND_URL}/appointments \
        -H 'Content-Type: application/json' \
        -d '{
            "patientName": "Test Patient",
            "doctorName": "Dr. Test",
            "date": "2024-12-20"
        }'
        sleep 0.1
    done
}

# Run multiple instances of the request function
for i in {1..50}; do
    send_requests &
done
