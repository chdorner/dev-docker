#!/usr/bin/env bash

function abspath() {
  pushd "$1" > /dev/null
  pwd
  popd > /dev/null
}

function print_usage() {
  echo "Usage: build.sh [directory with Dockerfile]"
}

if [ -z $1 ]; then
  print_usage
  exit 1
fi

if [ ! -e $1/Dockerfile ]; then
  print_usage
  exit 1
fi

dir=$(abspath $1)
tag=chdorner/$(basename $dir)
docker build -t $tag $dir
