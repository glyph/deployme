#!/bin/bash

set -x;
set -e;
mkdir -p wheelhouse;

docker build -t deployme-base -f base.docker .;
docker build -t deployme-builder -f build.docker .;
docker run --rm \
       -v "$(pwd)":/application -v "$(pwd)"/wheelhouse:/wheelhouse \
       deployme-builder;
docker build -t deployme-run -f run.docker .;
