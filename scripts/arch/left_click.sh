#!/bin/sh

urxvt -e trizen --noconfirm -Syu
echo "0" > ~/.config/polybar/scripts/arch/status
