#!/bin/bash

set -e

output=/dev/null
if [ "$DEBUG" == 'verbose' ]; then
  output=/dev/stdout
fi

info() {
  printf "\033[0;94m   [INFO] ${@}\033[0m\n"
}
warn() {
  printf "\033[0;33m   [WARN] ${@}\033[0m\n"
}
error() {
  printf "\033[0;31m  [ERROR] ${@}\033[0m\n"
}
success() {
  printf "\033[0;32m[SUCCESS] ${@}\033[0m\n"
}
debug() {
  if [ ! -z $DEBUG ] ; then printf "\033[0;37m  [DEBUG] ${@}\033[0m\n"; fi
}

for f in ./scripts/*.sh; do
  . "$f"
done
