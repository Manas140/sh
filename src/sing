#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

help() { printf "${cg}sing: print colored text
Example: sing ${cb}hello${cg}
${cr}Report issues at: https://github.com/manas140/sh/\n" && exit; }

case $1 in 
  "") printf "${cr}Error: No Text Provided\n" && exit 1;;
  *h|*help) help;;
esac

chars=$(printf "$@" | grep -o . | sed 's/ /~~/g')
for char in $chars; do
  col=$(( 1 + $(date +%s%N) % 8 ))
  printf "\033[1;3%sm$char" "$col" | sed 's/~~/ /g'
done
printf "\n"
