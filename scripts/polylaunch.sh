#!/bin/bash

MON0=`xrandr -q | grep 'HDMI1 connected'`
MON1=`xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1`
MON2=`xrandr --output eDP1 --auto`

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ -n "$MON0" ] || [ ! "$MON0" = "" ]; then 
	echo $MON1
	#xrandr --dpi 92x88
	xrandr --dpi 96
	sleep 1
	polybar -r main &
	polybar -r docked &
	echo "Bars launched..."
else
	echo $MON2
	#xrandr --dpi 99x103
	xrandr --dpi eDP1
	sleep 1
	polybar -r mobile &
	echo "Bar launched..."
fi

exit 0;
