#!/usr/bin/env zsh
printf "$1: "
printf "$({/usr/bin/time -f '%e' $2 > /dev/null} 2>&1)s\n"
exit 0
