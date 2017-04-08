#!/usr/bin/env bash

echo "branch= $GIT_BRANCH"
GIT_BRANCH=${GIT_BRANCH/origin\/}
DTAG="${GIT_BRANCH/feature\/#}"

echo "DOCKER_TAG=$DTAG"

echo "DOCKER_TAG=$DTAG" > $WORKSPACE/myjob.properties
