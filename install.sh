#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

printf "${cr}"
case $1 in 
  u) for script in $(ls src/); do 
    if sudo rm /usr/local/bin/$script 2>/dev/null; then
      printf "${cg}[*] $script Uninstalled\n"
    else
      printf "${cr}[-] There Was An Error While Uninstalling $script\n"
    fi
    done;;
  i) for script in $(ls src/); do
    if sudo cp src/$script /usr/local/bin/$script 2>/dev/null; then
      printf "${cg}[*] $script Installed\n" 
    else
      printf "${cr}[-] There Was An Error While Installing $script\n"
    fi
    done;;
  up) sh install.sh u
    printf "${cr}"
    git pull && sh install.sh i || printf "${cr}Error: Please Resolve Git Errors\n";;
  *) printf "${cg}Usage: ./install.sh ${cb}[i|u|up]${cb}
    i:${cg} Install
    ${cb}u:${cg} Uninstall
   ${cb}up:${cg} Update\n"
esac
