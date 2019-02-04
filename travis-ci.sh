#!/bin/sh -e

if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
  echo "Not building docker images out of Pull Requests"
  exit 0
fi

if [ ! -z "${TRAVIS_BRANCH}" ]; then
  SLUG="collectd/ci:${TRAVIS_BRANCH}"
  docker build --pull -t "${SLUG}" .
  docker inspect "${SLUG}"
  docker history "${SLUG}"
  echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_LOGIN}" --password-stdin
  docker push "${SLUG}"
else
  echo 'no $TRAVIS_BRANCH defined, exiting'
  exit 1
fi
