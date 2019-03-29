#!/bin/bash

address=$(ipfs id | jq -r '.Addresses')
peers=$(ssh -i ~/Downloads/LightsailDefaultKey-ap-south-1.pem ubuntu@13.127.85.166 "ipfs swarm peers")
addr=${address:5:79}
array=($(echo "$peers" | tr ' ' '\n'));
for element in "${array[@]}"
do
    ipfs swarm connect $element 
done
echo "Done"
ssh -i ~/Downloads/LightsailDefaultKey-ap-south-1.pem ubuntu@13.127.85.166 "ipfs swarm connect $addr"

