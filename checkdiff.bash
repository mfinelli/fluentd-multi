#!/bin/bash -e

# inspect the diff between the desired plugins
# usage: ./checkdiff.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

diff -r fluentd-kubernetes-daemonset/docker-image/v1.9/debian-{cloudwatch,loggly}

exit 0
