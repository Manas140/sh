#!/bin/sh

cr="\033[0;0m\033[1;31m"
cg="\033[0;0m\033[1;32m"
cb="\033[0;0m\033[1;34m"
help() { printf "${cg}rain: rain of text
Usage: rain ${cb}text${cg} ${cb}[delay]${cg}
Example: rain ${cb}\" █ \"${cg} ${cb}0.05
${cr}Report issues at: https://github.com/manas140/sh/\n" && exit; }

case $1 in 
  "") printf "${cr}Error: No Text Provided.\n" && exit 1;;
  *h|*help) help;;
esac

case $2 in 
  "") wait=0;;
  *) wait=$2;; 
esac

while true; do
  c=$(( $(date +%s%N) % 8 ))
  printf "\033[1;3%sm$1" "$c"
  sleep $wait
done
