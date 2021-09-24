#!/bin/sh

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

printf "${cr}"
case $1 in 
  u) for script in $(ls src/); do 
    rm -r /usr/local/bin/$script && printf "${cg}[*] $script Uninstalled\n" || printf "${cr}[-] There Was An Error While Uninstalling $script\n"; 
  done;;
  i) for script in $(ls src/); do
    cp src/$script /usr/local/bin/$script && printf "${cg}[*] $script Installed\n" || printf "${cr}[-] There Was An Error While Installing $script\n";
  done;;
  up) sh install.sh u
    printf "${cr}"
    git pull && sh install.sh i || printf "${cr}Please Resolve Git Errors\n";;
  *) printf "${cg}Usage: ./install.sh ${cb}[i|u|up]${cb}
    i:${cg} Install
    ${cb}u:${cg} Uninstall
   ${cb}up:${cg} Update\n"
esac
