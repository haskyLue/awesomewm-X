#!bin/bash

$ mv ~/.config/awesome ~/.config/awesome.original
$ cp -r ~/.config/awesomewm-X ~/.config/awesome
$ mkdir ~/.config/awesome/Xdefaults/$USER
$ mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
$ ln -sfn ~/.config/awesome/Xdefaults/default/.Xdefaults ~/.Xdefaults
$ ln -sfn ~/.config/awesome/themes/pdq ~/.config/awesome/themes/current
$ ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png
$ mkdir ~/.cache
$ mkdir ~/.cache/awesome
$ touch ~/.cache/awesome/stderr
$ touch ~/.cache/awesome/stdout

$ mv ~/.xinitrc ~/.xinitrc.original
$ cp ~/.config/awesomewm-X/skel/.xinitrc ~/.xinitrc
 
echo "Moved current .Xdefaults and .xinitrc files to ~/.config/awesome/Xdefaults/$USER/.Xdefaults and ~/.xinitrc.original\n\n
Done.... try running 'startx' in the console to start Awesome.\n\n
Make sure to add 'dbus' to the DAEMONS array,\n
Virtualbox installs likely should also add 'vboxguest' 'vboxsf' 'vboxvideo':\n\n
# nano -w /etc/rc.conf\n\n
-- add dbus vboxguest vboxsf vboxvideo to DAEMONS array"
sleep 60s