#!/bin/bash

docker-compose down -v

# Change directory to pyrelay
cd pyrelay-master

# Run docker-compose down with volume removal
docker-compose down -v

# Exit with status code 0
exit 0