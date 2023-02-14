#! /bin/sh

DOCKER_BUILDKIT=1 docker build -f Dockerfile-${1} \
  -t dev_env_${1}:latest \
  $(for i in `cat .env`; \
  do out+="--build-arg $i " ; \
  done; echo $out;out="") \
  .
