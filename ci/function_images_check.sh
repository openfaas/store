#!/bin/bash

echo "Running function image check..."

images=($(cat functions.json | jq '.functions[].images[]'))

uniq_images=($(echo "${images[@]}" |xargs -n1 | sort |uniq))

for i in "${uniq_images[@]}"; do
    image=$(echo $i | tr -d '"')

    echo "Checking image: ${image}"
    crane manifest $image || { echo "Failure: Check of ${image} failed, exiting..."; exit 1; }
done;

echo "All function images were found"
