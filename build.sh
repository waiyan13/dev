#! /bin/sh

DOCKER_BUILDKIT=1 docker build -f Dockerfile-python \
  -t dev_env_python:latest \
  $(for i in `cat .env`; \
  do out+="--build-arg $i " ; \
  done; echo $out;out="") \
  .
