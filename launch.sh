#!/usr/bin/env sh

# Terminate already running bar instances

#kill all scripts (arch linux updates)
#kill -9 -$(ps -o pgid -p $(cat ~/.config/polybar/scripts/arch/arch_update.pid) | tail -n1 | cut -c 1-)
kill -9 -$(ps -o pgid -p $(cat ~/.config/polybar/scripts/arch/arch_update.pid) | tail -n1 | sed 's/^[ \t]*//;s/[ \t]*$//')
kill -9 -$(ps -o pgid -p $(pgrep -o polybar_updates) | tail -n1 | cut -c 1-)

#killall -q polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &

# Launch arch updates script
exec ~/.config/polybar/scripts/arch/arch_update.sh & echo $! | head -n1 > ~/.config/polybar/scripts/arch/arch_update.pid

echo "Bars launched..."
