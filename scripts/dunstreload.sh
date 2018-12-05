#!/bin/bash

killall dunst
sleep 1
dunst &
sleep 2
notify-send 'Config reloaded'

