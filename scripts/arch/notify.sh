#!/bin/sh

if  [ $(cat ~/.config/polybar/scripts/arch/status) -eq 0 ];
then
		notify-send 0
else
		notify-send "$(cat .config/polybar/scripts/arch/packages)"
fi
