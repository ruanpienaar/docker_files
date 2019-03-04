#!/bin/bash
set -xe
git clone https://gitlab.com/superbet/kafcat
make -C kafcat fetch-deps
docker build -t kafka_app_soak_test .
rm -rf kafcat