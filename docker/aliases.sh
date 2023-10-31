#!/usr/bin/env bash

#-----------------------------------------------------------------------
# Docker Machine
# https://docs.docker.com/machine/get-started/#create-a-machine
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Docker Compose
#-----------------------------------------------------------------------

alias dockerc="docker-compose"
alias dkrup="docker-compose stop < /dev/null 2> /dev/null; docker-compose up --build"
alias dkrstop="docker-compose stop < /dev/null 2> /dev/null"
alias dkroff="docker ps; docker-compose stop < /dev/null 2> /dev/null; docker rm -f \"$(docker ps -a -q < /dev/null 2> /dev/null)\" < /dev/null 2> /dev/null; docker ps -a"
alias dkr0="docker images; docker-compose stop < /dev/null 2> /dev/null; docker rmi -f \"$(docker images -a -q < /dev/null 2> /dev/null)\" < /dev/null 2> /dev/null; docker images"
