#!/bin/sh

cr="\033[0;0m\033[1;31m"
cg="\033[0;0m\033[1;32m"
cb="\033[0;0m\033[1;34m"

if ! type pulsemixer >/dev/null; then
  printf "${cr}Error: Could not find 'pulsemixer', Make sure you have pulsemixer installed.\n" && exit 1;
fi

help() { printf "${cg}au: audio
Usage: au ${cb}[vol|m]${cg}
  ${cb}vol:${cg} volume value between 0-150
  ${cb}m:${cg} mute toggle
Example: au ${cb}40${cg}
${cr}Report issues at: https://github.com/manas140/sh/\n"; }

main() { 
  str=$( pulsemixer --get-volume )
  vol=${str% *}
  status=$( pulsemixer --get-mute )
  if [ $vol -gt 60 ]; then
    printf "${cr}Volume: $vol\n";
  elif [ $vol -gt 30 ]; then
    printf "${cg}Volume: $vol\n";
  else  
    printf "${cb}Volume: $vol\n";
  fi
  case $status in 
    0) printf "${cg}Status: Unmuted\n";;
    1) printf "${cr}Status: Muted\n";;
  esac
}

case $1 in
  "") main;;
  *m*) pulsemixer --toggle-mute;;
  *) if [ $1 -eq $1 ] 2>/dev/null; then 
    pulsemixer --set-volume $1;
  else
    help
  fi;;
esac
