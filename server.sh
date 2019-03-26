#!/bin/bash

docker-compose --file server/docker-compose.yml up --build $@
