#!/bin/bash
kubectl logs -l app=webapp --tail=100 -n default | grep "ERROR" | while read -r line; do
    echo "Error detected: "
    echo "" >> error_log.txt
done
