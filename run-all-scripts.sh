#!/bin/bash

output=/dev/null
if [ "$DEBUG" == 'verbose' ]; then
  output=/dev/stdout
fi

declare -a __ctxt=()
__push_context() {
  __ctxt+="$@"
}
__pop_context() {
  unset __ctxt[-1]
}
__print_with_context() {
  printf "\033[0;$1m$2 "
  if [[ "${#__ctxt[@]}" -ne "0" ]]; then
    printf "\033[0;4;$1m${__ctxt[@]}\033[0m "
  fi
  printf "\033[0;$1m$3\033[0m\n"
}

info() {
  #printf "\033[0;94m   [INFO]${__ctxt[@]} ${@}\033[0m\n"
  __print_with_context "94" "   [INFO]" "${@}"
}
warn() {
  #printf "\033[0;33m   [WARN]${__ctxt[@]} ${@}\033[0m\n"
  __print_with_context "33" "   [WARN]" "${@}"
}
error() {
  #printf "\033[0;31m  [ERROR]${__ctxt[@]} ${@}\033[0m\n"
  __print_with_context "31" "  [ERROR]" "${@}"
}
success() {
  #printf "\033[0;32m[SUCCESS]${__ctxt[@]} ${@}\033[0m\n"
  __print_with_context "32" "[SUCCESS]" "${@}"
}
debug() {
  if [ ! -z $DEBUG ] ; then
    #printf "\033[0;37m  [DEBUG] ${@}\033[0m\n"
    __print_with_context "37" "  [DEBUG]" "${@}"
  fi
}

for f in ./scripts/*.sh; do
  debug ">>running $f<<"
  __push_context $(basename "$f")
  . "$f"
  __pop_context
done
