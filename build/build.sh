#!/bin/bash

for container in `cat build_containers`
do
  cd $container
  echo "Building $container"
  bash create.sh >/dev/null 2>/dev/null
  if [ "$?" -ne 0 ]
  then
    echo "Error building container $container"
    cd ..
    exit 1
  else
    echo "Built container $container"
    cd ..
  fi
done
