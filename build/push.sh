#!/bin/bash

cd ../
for container in `cat build/build_containers`
do
  echo "Pushing $container to Docker Hub"
  docker push manmon/$container >/dev/null 2>/dev/null
  if [ "$?" -ne 0 ]
  then
    echo "Error pushing container $container"
    cd ..
    exit 1
  else
    echo "Pushed container $container"
    cd ..
  fi
done
