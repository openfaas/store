#!/bin/bash

echo "Running function image check..."

images=($(cat functions.json | jq '.functions[].images[]'))

for image in "${images[@]}"; do 

    stem=$(echo $image | sed 's/"//g;s/:/\/tags\//g')
    url="https://hub.docker.com/v2/repositories/${stem}/"
    http_status=$(curl -Iks -X GET $url 2>/dev/null | head -n 1 | cut -d' ' -f2)

    if ! [ "$http_status" == "200" ]; then
        echo "Failure: Check of ${image} returned a non-200 status code, exiting..."
        exit 1
    fi

done; 

echo "All function images were found"
