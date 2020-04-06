#!/bin/bash

docker build -t base . -t framer/metrics:latest
docker push framer/metrics:latest
