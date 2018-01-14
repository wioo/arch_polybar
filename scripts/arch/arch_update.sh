#!/bin/sh
  

nb_arch=$(checkupdates | wc -l)
nb_aur=$(trizen -Su --aur --quiet | wc -l)

updates=$(("$nb_arch" + "$nb_aur"))

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
        checkupdates | nl -w2 -s'. ' >> ~/.config/polybar/scripts/arch/packages
      else
        checkupdates | nl -w2 -s'. ' >> ~/.config/polybar/scripts/arch/packages
        echo -e "\nAUR updates" >> ~/.config/polybar/scripts/arch/packages
        trizen -Su --aur --quiet | awk  '{print substr($2, 1, length($2) - 1) " " $3 " -> " $5}'| nl -w2 -s '. ' >> ~/.config/polybar/scripts/arch/packages
       fi
else
if [ "$nb_aur" -eq "0" ];then
        echo "" > /dev/null
        else
        echo "AUR updates" > ~/.config/polybar/scripts/arch/packages
        trizen -Su --aur --quiet | awk  '{print substr($2, 1, length($2) - 1) " " $3 " -> " $5}'| nl -w2 -s '. ' >> ~/.config/polybar/scripts/arch/packages
       fi
fi

sleep 600

done

