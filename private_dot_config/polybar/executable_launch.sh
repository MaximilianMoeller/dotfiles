killall -q polybar

for name in $(xrandr --query | grep "connected" | grep "primary" | cut -d" " -f1); do
	MONITOR=$name polybar -c ~/.config/polybar/config.ini --reload primary-top &
done

for name in $(xrandr --query | grep "connected" | grep -v "primary" | cut -d" " -f1); do
	MONITOR=$name polybar -c ~/.config/polybar/config.ini --reload secondary-top &
done
