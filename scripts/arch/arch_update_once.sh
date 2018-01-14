#!/bin/sh
echo '' > ~/.config/polybar/scripts/arch/status
echo "Updates" > ~/.config/polybar/scripts/arch/packages

nb_arch=$(checkupdates | wc -l)
nb_aur=$(trizen -Su --aur --quiet | wc -l)

updates=$(("$nb_arch" + "$nb_aur"))

if [ "$updates" -gt 0 ]; then
    echo "%{F#e60053}$updates" > ~/.config/polybar/scripts/arch/status
else
    echo "0" > ~/.config/polybar/scripts/arch/status
fi

if [ "$nb_arch" -ne "0" ]; then
        if [ "$nb_aur" -eq "0" ];then
        checkupdates >> ~/.config/polybar/scripts/arch/packages
      else
        checkupdates >> ~/.config/polybar/scripts/arch/packages
        echo -e "\nAUR updates" >> ~/.config/polybar/scripts/arch/packages
        trizen -Su --aur --quiet >> ~/.config/polybar/scripts/arch/packages
       fi
else
if [ "$nb_aur" -eq "0" ];then
        echo "" > /dev/null
        else
        echo "AUR updates" > ~/.config/polybar/scripts/arch/packages
        trizen -Su --aur --quiet >> ~/.config/polybar/scripts/arch/packages
       fi
fi
