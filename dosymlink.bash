#!/bin/bash -e

# symlink files from submodule to main directory
# usage: ./dosymlink.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

VER=v1.9

links=(Dockerfile entrypoint.sh plugins/parser_kubernetes.rb
       plugins/parser_multiline_kubernetes.rb)

mkdir -p ./plugins

for l in ${links[@]}; do
  ln -sf fluentd-kubernetes-daemonset/docker-image/$VER/debian-cloudwatch/$l $l
done

exit 0
