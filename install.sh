#!bin/bash

if [ `id -u` -eq 0 ]; then
   echo "Do not run me as root! =)"
   exit
fi

cd ~/.config
git clone https://github.com/idk/awesomewm-X.git
git clone https://github.com/idk/conky-X.git
git clone https://github.com/idk/luakit-X.git
mv ~/.config/conky ~/.config/conky.original
cp -r ~/.config/conky-X ~/.config/conky
mv ~/.config/awesome ~/.config/awesome.original
cp -r ~/.config/awesomewm-X ~/.config/awesome
mv ~/.config/luakit ~/.config/luakit.original
cp -r ~/.config/luakit-X ~/.config/luakit
mkdir ~/.config/awesome/Xdefaults/$USER
mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
ln -sfn ~/.config/awesome/Xdefaults/default/.Xdefaults ~/.Xdefaults
ln -sfn ~/.config/awesome/themes/pdq ~/.config/awesome/themes/current
ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png
ln -sfn ~/.config/awesome/themes/current/theme.lua ~/.config/luakit/awesometheme.lua
  
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