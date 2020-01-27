#!/bin/bash

go build
docker build -t radowan/demo-app .
docker push radowan/demo-app
