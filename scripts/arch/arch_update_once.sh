#!/bin/sh
echo '' > ~/.config/polybar/scripts/arch/status

path=${HOME}/.config/polybar/scripts/arch/

   checkupdates | nl -w2 -s '. ' >| ${path}repo.pkgs
   trizen -Su --aur --quiet | sed 's/://;s/==/-/' >| ${path}aur.pkgs
   updates=$(cat ${path}*.pkgs | wc -l)
                                    
   echo "0" >| ${path}status
   [ $updates -gt 0 ] && echo "%{F#e60053}$updates" >| ${path}status

   >| ${path}packages
   [ -s ${path}repo.pkgs ] && cat ${path}repo.pkgs >> ${path}packages
   [ -s ${path}repo.pkgs ] && [ -s ${path}aur.pkgs ] && printf "\n" >> ${path}packages
   [ -s ${path}aur.pkgs ] && sed '1iAUR Updates' ${path}aur.pkgs >> ${path}packages
