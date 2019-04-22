#!/bin/sh

echo "Running function image check..."

images=($(cat functions.json | jq '.functions[].images[]' | sed 's/"//g;s/:/\/tags\//g'))

for image in "${images[@]}"; do 

    url="https://hub.docker.com/v2/repositories/${image}/"
    http_status=$(curl -Iks -X GET $url 2>/dev/null | head -n 1 | cut -d' ' -f2)

    if ! [ "$http_status" == "200" ]; then
        echo "Failure: cURL of address $url returned a non-200 status code, exiting..."
        exit 1
    fi

done; 

echo "All function images were found"
