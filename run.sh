#!/bin/bash
source ./common.sh

echo_and_run docker-compose up -d

echo -e "\nTo attach container, docker exec -it <container-id> bash"
