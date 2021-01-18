#!/bin/sh

docker run -ti --rm --net=host -v /volume1/docker/docker-fing/data:/home/fing kgerbers/fing
