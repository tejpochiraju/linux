#!/bin/sh
makeline(){ printf "%${1:-$COLUMNS}s\n" ""|tr " " ${2:-#}; }
wlansig() { echo "" ; PRINT_FORMAT="\e[0;33m%s%s\e[0m%s\e[0;32m%s\e[0m%s%s\r" ; while true ; do sig=$(awk 'NR==3 {print $3}' /proc/net/wireless) ; printf $PRINT_FORMAT "signal = " ${sig/./} " : |" $(makeline ${sig/./} ${2:-=}) $(makeline $(expr 99 - ${sig/./} - 15) -) "|" ; sleep ${1:-"1s"} ; done ; }
