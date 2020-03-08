#/bin/bash -e

# build and publish a docker image
# usage: ./publish.bash VERSION

if [[ $# -ne 1 ]]; then
  echo >&2 "usage: $(basename "$0") VERSION "
  exit 1
fi

docker build -t mfinelli/fluentd-multi .
docker tag mfinelli/fluentd-multi mfinelli/fluentd-multi:v$1
docker push mfinelli/fluentd-multi:v$1

exit 0
