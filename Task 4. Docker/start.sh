#!/bin/bash

dname="my-app:2.4"

echo "(tput setaf 3)Docker build$(tput setaf 7)"
docker build -t $dname .
echo "$(tput setaf 2)Success $(tput setaf 7)"
echo "$(tput setaf 3)Show images $(tput setaf 7)"
docker image ls
echo "$(tput setaf 3)Docker run $(tput setaf 7)"
docker run -d $dname
echo "$(tput setaf 2)Success $(tput setaf 7)"
echo "$(tput setaf 3)docker container ls $(tput setaf 7)"
docker container ls