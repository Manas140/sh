#!/bin/sh

scripts=$(ls --hide 'LICENSE' --hide '*.*')
red="\033[1;31m"
green="\033[1;32m"
case $1 in
  i|install)
    for script in $scripts; do
      cp -r $script /usr/local/bin/. && printf "$green[*] $script installed\n"
    done;;
  u|uninstall) 
    for script in $scripts; do
      rm -rf /usr/local/bin/$script && printf "$red[-] $script uninstalled\n"
    done;;
  *) printf "$green""i|install          install scripts.\nu|uninstall        uninstall scripts.\n";;
esac
