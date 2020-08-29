#!/bin/bash

# inspect the diff between the desired plugins
# usage: ./checkdiff.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

diff -r fluentd-kubernetes-daemonset/docker-image/v1.11/debian-{cloudwatch,loggly}
diff -r fluentd-kubernetes-daemonset/docker-image/v1.11/debian-{cloudwatch,gcs}

exit 0
