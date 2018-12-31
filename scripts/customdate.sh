#!/bin/bash

t=0

toggle () {
	t=$(((t + 1) % 2))
}


trap "toggle" USR1

while true; do
	if [ $t -eq 0 ]; then
		date +%l:%M%p | awk '{$1=$1};1'
	else
		date +"%Y/%m/%d %l:%M%p" | awk '{$2=$2};1'
	fi
	sleep 1 &
	wait
done

