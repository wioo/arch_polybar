#!/usr/bin/env bash

path=${HOME}/.config/polybar/scripts/arch/
#trap 'exit' SIGINT

function main_loop {
	while true; do
	echo '' > ~/.config/polybar/scripts/arch/status
	check_for_updates
	sleep 600
	done
}

function status {
	echo $$ > ${path}polybar_updates.pid
	while true; do
	cat ~/.config/polybar/scripts/arch/status
	sleep 1
	done
}

function check_for_updates {
	checkupdates | nl -w2 -s '. ' >| ${path}repo.pkgs
	
	# yay AUR helper
	yay -Qu --aur | nl -w2 -s '. '  >| ${path}aur.pkgs

	# aurutils AUR helper
	#paclist aurpkgs | aur vercmp | sed -e '0,/:/ s/://' | nl -w2 -s '. '  >| ${path}aur.pkgs
	
	updates=$(cat ${path}*.pkgs | wc -l)

	echo "%{T7}0%{T-}" >| ${path}status
	[ $updates -gt 0 ] && echo "%{T2}%{F#e60053}$updates" >| ${path}status

	>| ${path}packages
	[ -s ${path}repo.pkgs ] && cat ${path}repo.pkgs >> ${path}packages
	[ -s ${path}repo.pkgs ] && [ -s ${path}aur.pkgs ] && printf "\n" >> ${path}packages
	[ -s ${path}aur.pkgs ] && sed '1iAUR Updates' ${path}aur.pkgs >> ${path}packages
}

function notify {
	if [[ $(cat ~/.config/polybar/scripts/arch/status) == %{T7}0%{T-} ]]
	then
		notify-send 0
	else
		notify-send "$(cat ~/.config/polybar/scripts/arch/packages)"
	fi
}

function upgrade {
	# yay AUR helper
	urxvt -e sh -c "yay --noconfirm -Syu"
	
	# aurutils AUR helper
	#urxvt -e sh -c "aur sync -u --noview; sudo pacman -Syu --noconfirm"
	echo "%{T7}0%{T-}" > /home/blaz/.config/polybar/scripts/arch/status
}

function clean {
	urxvt -e sh -c "clean_aurutils_cache && sudo pacman -Sc"
}


[[ $# -eq 0 ]] && main_loop
[[ $1 == "-s" ]] && status
[[ $1 == "-q" ]] && echo '' > ~/.config/polybar/scripts/arch/status && check_for_updates
[[ $1 == "-n" ]] && notify
[[ $1 == "-u" ]] && upgrade
[[ $1 == "-c" ]] && clean
