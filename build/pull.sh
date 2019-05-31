#!/bin/bash
for container in `cat build_containers`
do
  echo "Pulling $container"
  docker pull manmon/$container >/dev/null 2>/dev/null
  if [ "$?" -ne 0 ]
  then
    echo "Error pulling container $container"
    exit 1
  else
    echo "Pulled container $container"
  fi
done
