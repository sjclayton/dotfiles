[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xrandr --output eDP1 --gamma 1.0:1.0:0.95
numlockx &
xset s off
xset dpms 0 0 3600

exec i3
