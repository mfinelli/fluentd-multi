#!/bin/bash -e

# symlink files from submodule to main directory
# usage: ./dosymlink.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

VER=v1.9

links=(Dockerfile entrypoint.sh
       plugins/{parser_kubernetes.rb,parser_multiline_kubernetes.rb}
       conf/{kubernetes,prometheus,systemd}.conf)

mkdir -p ./{conf,plugins}

for l in ${links[@]}; do
  cat fluentd-kubernetes-daemonset/docker-image/$VER/debian-cloudwatch/$l > $l
done

exit 0
