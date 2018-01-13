# arch_polybar
Check for updates on Arch system (scripts for polybar)
This setup uses "Awesome Font"
Requires libnotify

1. Create directories (polybar, scripts, arch) under ~/.config
   ```
   mkdir -p ~/.config/polybar/scripts/arch
  ```

2. copy files from git

3. add lines to polybar config file
```
font-0 = fixed:pixelsize=10;1
font-1 = unifont:fontformat=truetype:size=8:antialias=false;0
font-2 = siji:pixelsize=10;1
font-3 = Font Awesome 5 Free:pixelsize=10;1
font-4 = Font Awesome 5 Free Solid:pixelsize=10;1
font-5 = Font Awesome 5 Brands:pixelsize=10;1


[module/updates-arch]
type = custom/script
exec = polybar_updates
tail = true
label = %output%
format = <label>
format-prefix = " "
click-right = arch_update_once&
click-left = left_click
click-middle = notify
```

4. create symbolic links in e.g. /usr/bin or ~/bin
arch_update once -> arch_update_once.sh
left_click -> left_click.sh
notify -> notify.sh
polybar_updates -> updates.sh

5. 




