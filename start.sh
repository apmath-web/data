#!/bin/bash
git submodule update --init --recursive --jobs 7
#docker build -t application ./applications/
#docker build -t calculations ./calculations/
docker build -t clients ./clients/
docker build -t currency ./currency/
docker build -t expenses ./expenses/
#docker build -t interest ./interest/
#docker build -t loans ./loans/
