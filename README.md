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

* left click: check for updates"

* right click: upgrade

* middle click: clean cache

* scroll up: notify 

This setup uses "Font Awesome"

Requires: libnotify, yay or aurutils (also pacman-contrib if using aurutils), urxvt, sed and notification-daemon like dunst or similar...

1. Create directories (scripts, arch) under ~/.config/polybar
   ```
   mkdir -p ~/.config/polybar/scripts/arch
   ```
2. copy files from github and make them executable
optionally change yay to aurutils in arch_updates.sh

3. edit polybar config file.
Add:

```
[module/updates-arch]
type = custom/script
exec = "arch_updates -s"
tail = true
format = <label>
format-prefix = " "
click-right = "arch_updates -u&"
click-left = "arch_updates -q&"
click-middle = "arch_updates -c&"
scroll-up = "arch_updates -n&"
```

4. create symbolic link in e.g. /usr/bin or ~/bin

arch_updates -> ~/.config/polybar/scripts/arch/arch_updates.sh

If using aurutils put clean_aurutils_cache to /usr/bin or ~/bin

5. Change your i3 config

delete bar section

add
```
exec_always --no-startup-id $HOME/.config/polybar/launch.sh
```





