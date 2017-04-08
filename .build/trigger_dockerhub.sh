#!/usr/bin/env bash
set -e -o pipefail

echo "trigger dockerhub builds for Tag $DOCKER_TAG:"

URLS=(
	"https://registry.hub.docker.com/u/larger/overtt/trigger/bfc5c145-bddf-404c-8ae7-356f928656e9/"
)
PAYLOAD='{"source_type": "Tag", "source_name": "'$DOCKER_TAG'"}'

if [[ $DOCKER_TAG == "master" ]] ; then
   PAYLOAD='{"docker_tag": "'latest'"}'
fi

#Loop
for URL in "${URLS[@]}"
do
	echo "URL: $URL"
  	echo "PAYLOAD: $PAYLOAD"
    curl -H "Content-Type: application/json" --data "$PAYLOAD" -X POST "$URL"
    echo " - done!"
done
