#!bin/bash

mv ~/.config/conky ~/.config/conky.original
cp -r ~/.config/conky-X ~/.config/conky
mv ~/.config/awesome ~/.config/awesome.original
cp -r ~/.config/awesomewm-X ~/.config/awesome
mkdir ~/.config/awesome/Xdefaults/$USER
mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
ln -sfn ~/.config/awesome/Xdefaults/default/.Xdefaults ~/.Xdefaults
ln -sfn ~/.config/awesome/themes/pdq ~/.config/awesome/themes/current
ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png
mkdir ~/.cache
mkdir ~/.cache/awesome
touch ~/.cache/awesome/stderr
touch ~/.cache/awesome/stdout
mkdir ~/.config/conky/arch/.cache

mv ~/.xinitrc ~/.xinitrc.original
cp ~/.config/awesomewm-X/skel/.xinitrc ~/.xinitrc
 
echo "Moved ~/.Xdefaults to ~/.config/awesome/Xdefaults/$USER/.Xdefaults and ~/.xinitrc to ~/.xinitrc.original

Done.... try running 'startx' in the console to start Awesome.

Make sure to add 'dbus' to the DAEMONS array,
Virtualbox installs likely should also add 'vboxguest' 'vboxsf' 'vboxvideo':
# nano -w /etc/rc.conf

-- add dbus vboxguest vboxsf vboxvideo to DAEMONS array"
exit