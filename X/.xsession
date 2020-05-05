xset -b off
setxkbmap -option "caps:swapescape"
if [[ "$(cat ~/mode.sh)" == "dark" ]]; then
	polybar minimal &
else
	polybar minimal_light &
fi
# feh --bg-fill ~/pictures/wallpapers/android_adjusted.png &
feh --bg-fill ~/pictures/wallpapers/anime_girl_on_robot.png &
redshift &
dunst &
unclutter &
# 2bwm
