#!/bin/sh

updates_arch=$(checkupdates | tee ~/.config/polybar/scripts/arch/packages | wc -l)
updates_aur=$(trizen -Su --aur --quiet | tee -a ~/.config/polybar/scripts/arch/packages |  wc -l)

updates=$(("$updates_arch" + "$updates_aur"))

while true;
do
echo "Updates" > ~/.config/polybar/scripts/arch/packages

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
echo "" > ~/.config/polybar/scripts/arch/packages
if [ "$nb_aur" -eq "0" ];then
        echo "" > /dev/null
        else
        echo -e "AUR updates" > ~/.config/polybar/scripts/arch/packages
        trizen -Su --aur --quiet >> ~/.config/polybar/scripts/arch/packages
       fi
fi

sleep 600

done

