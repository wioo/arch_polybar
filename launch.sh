#!/usr/bin/env sh
  
#kill all scripts (arch_updates)
kill -9 -$(ps -o pgid -p $(cat ~/.config/polybar/scripts/arch/arch_updates.pid) | tail -n1 | sed 's/^[ \t]*//;s/[ \t]*$//')
kill -9 $(cat ~/.config/polybar/scripts/arch/polybar_updates.pid)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &

# Launch arch_updates script
arch_updates & echo $! > ~/.config/polybar/scripts/arch/arch_updates.pid
echo "Bars launched..."
