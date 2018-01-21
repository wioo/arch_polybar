# arch_polybar
Check for updates on Arch system with i3-wm(optional) and polybar

no updates

![Image 1](https://i.imgur.com/H7rKgiX.png)

working

![Image 1](https://i.imgur.com/98eSzTU.png)

updates

![Image 1](https://i.imgur.com/PQNtLNz.png)

list of updates

![Image 1](https://i.imgur.com/ZCV15ls.png)


**Usage:**

* left click: executes trizen

* right click: manual refresh

* middle click: show list of updates


This setup uses "Font Awesome"

Requires: libnotify, trizen, urxvt, sed and notification-daemon like dunst or similar...

1. Create directories (scripts, arch) under ~/.config/polybar
   ```
   mkdir -p ~/.config/polybar/scripts/arch
   ```
2. copy files from git and make them executable

3. edit polybar config file.
Add:

```
font-0 = fixed:pixelsize=10;1
font-1 = unifont:fontformat=truetype:size=8:antialias=false;0
font-2 = siji:pixelsize=10;1
font-3 = Font Awesome 5 Free:pixelsize=10;1
font-4 = Font Awesome 5 Free Solid:pixelsize=10;1
font-5 = Font Awesome 5 Brands:pixelsize=10;1


[module/updates-arch]
type = custom/script
exec = "arch_updates -s&"
tail = true
format = <label>
format-prefix = " "
click-right = "arch_updates -u&"
click-left = "arch_updates -c&"
click-middle = "arch_updates -n&"
```

4. create symbolic link in e.g. /usr/bin or ~/bin

arch_updates -> ~/.config/polybar/scripts/arch/arch_updates.sh

5. Change your i3 config

delete bar section

add
```
exec_always --no-startup-id $HOME/.config/polybar/launch.sh
```





