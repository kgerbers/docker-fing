#!/bin/sh

docker run -ti --rm --net=host -v /home/kgerbers/Git/docker-fing/data:/home/fing kgerbers/fing
