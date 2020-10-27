#!/bin/bash

if [ "$1" == "d" ]; then
	docker ps -a | grep 'superset*' | awk '{ print $1 }' | xargs -I {} docker stop {}
	docker ps -a | grep 'superset*' | awk '{ print $1 }' | xargs -I {} docker rm {}
	docker images | grep '*superset*' | awk '{ print $3 }' | xargs -I {} docker rmi {} --force
elif [ "$1" == "dc" ]; then
	docker ps -a | grep 'superset*' | awk '{ print $1 }' | xargs -I {} docker stop {}
	docker ps -a | grep 'superset*' | awk '{ print $1 }' | xargs -I {} docker rm {}
elif [ "$1" == "di" ]; then
	docker images | grep '*superset*' | awk '{ print $3 }' | xargs -I {} docker rmi {} --force
elif [ "$1" == "run" ]; then
	docker-compose up -d --build
	docker-compose exec superset superset-init
else
	echo "Specify a task"
fi
