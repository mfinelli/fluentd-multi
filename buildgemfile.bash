#!/bin/bash -e

# create a gemfile that combines plugins
# usage: ./buildgemfile.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

VER=$(grep VER dosymlink.bash | awk -F\= '{print $2}')

# use cloudwatch as the default
cat fluentd-kubernetes-daemonset/docker-image/$VER/debian-cloudwatch/Gemfile > Gemfile

# now add everything added by loggly
diff fluentd-kubernetes-daemonset/docker-image/$VER/debian-{cloudwatch,loggly}/Gemfile | grep ^\> | sed 's/^..//' >> Gemfile

exit 0
