#!/bin/bash

MON0=`xrandr -q | grep 'HDMI1 connected'`
MON1=`xrandr --output eDP1 --auto --output HDMI1 --primary --auto --right-of eDP1`
MON2=`xrandr --output eDP1 --primary --auto`

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ -n "$MON0" ] || [ ! "$MON0" = "" ]; then 
	echo $MON1
	sleep 1
	polybar -r main &
	polybar -r extra &
	echo "Bars launched..."
else
	echo $MON2
	sleep 1
	MONITOR=eDP1 polybar -r main &
	echo "Bar launched..."
fi

exit 0;
