#!/bin/bash -e

# symlink files from submodule to main directory
# usage: ./dosymlink.bash

if [[ $# -ne 0 ]]; then
  echo >&2 "usage: $(basename "$0")"
  exit 1
fi

VER=v1.12

links=(Dockerfile entrypoint.sh
       plugins/{parser_kubernetes.rb,parser_multiline_kubernetes.rb}
       conf/{kubernetes,prometheus,systemd,tail_container_parse}.conf)

mkdir -p ./{conf,plugins}

for l in ${links[@]}; do
  cat fluentd-kubernetes-daemonset/docker-image/$VER/debian-cloudwatch/$l > $l
done

if [[ $(uname) == Darwin ]]; then
  sed -i '' 's/gem install bundler --version 2.2.6/gem install bundler --version 2.2.17/' Dockerfile
  sed -i '' 's/maintainer=".*"/maintainer="Mario Finelli"/' Dockerfile
  sed -i '' '/maintainer=".*"/a LABEL org.opencontainers.image.source https://github.com/mfinelli/fluentd-multi' Dockerfile
else
  sed -i 's/gem install bundler --version 2.2.6/gem install bundler --version 2.2.17/' Dockerfile
  sed -i 's/maintainer=".*"/maintainer="Mario Finelli"/' Dockerfile
  sed -i '/maintainer=".*"/a LABEL org.opencontainers.image.source https://github.com/mfinelli/fluentd-multi' Dockerfile
fi

chmod +x entrypoint.sh

exit 0
