#!/bin/bash

# Run pyrelay's compose file first
docker-compose -f pyrelay-master/docker-compose.yml up -d

# Run your main compose file
docker-compose up -d

exit 0