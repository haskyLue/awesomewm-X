#!/bin/bash
# autostart
# author pdq 11-27-2012 - 04-18-2013
#urxvtc -name "Screencaster" -e ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 30 -s 1920x1080 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -crf 0 -threads 0 startx.mkv
#sleep 2s
# Grab window manager name
if [ ! -z $DISPLAY ]; then
	WM_WINDOW=$(xprop -root _NET_SUPPORTING_WM_CHECK)
	WM_WINDOW=${WM_WINDOW##* }
	WM_NAME=$(xprop -id $WM_WINDOW 8s _NET_WM_NAME)
	WM_NAME=${WM_NAME##* }
	WM_NAME=`echo $WM_NAME | sed 's/\"//g'`
else
	WM_NAME=""
fi

# start daemons and services not auto started at boot
#[ -z "$(pidof httpd)" ] && sudo lamp.sh start
#[ -z "$(pidof transmission-daemon)" ] && sudo systemctl start transmission.service

# Mount @linux
sshfs pdq@192.168.0.10:/ /mnt/linux-pdq -C -p 34567

if [ "$WM_NAME" = "awesome" ]; then
	[ -z "$(pidof compton)" ] && compton -cF &
	sleep 2s
	feh --bg-scale $HOME/Pictures/wallpaper/1088253-bludragon.jpg &
	#sh ~/bin/rotate_wallpaper &
else
	## Start drop down terminal emulator
<<<<<<< HEAD
	[ -z "$(pidof yeahconsole)" ] && yeahconsole &
=======
	[ -z "$(pidof stjerm)" ] && stjerm -p top -k f12 -o 60 -ah false -sh /bin/sh -l 7000 -h 350 &
>>>>>>> 0a7e24c2894e481ad048a78257189ea764921ed8
fi

# Start dmenu clipboard (dmenuclip/dmenurl)
killall -q clipbored
clipbored 

# Start system information display
#[ -z "$(pidof conky)" ] && conky -d -c "$HOME"/.config/conky/.conkye17 &

# Start IM server and IRC client
[ -z "$(pidof weechat-curses)" ] && urxvtc -name "IRC1" -e weechat-curses && urxvtc -name "IRC2" -e weechat-curses -d ~/.weechat-priv

# Start custom keyboard shortcuts
[ -z "$(pidof xbindkeys)" ] && xbindkeys &

# Start terminal apps
[ -z "$(pidof htop)" ] && urxvtc -name "Htop" -e htop

# Main terminal
urxvtc -name "Term"
urxvtc -name "Term2"

# SSH @linux
urxvtc -name "SSH" -e ssh 192.168.0.10 -p34567

#[ -z "$(pidof nmon)" ] && urxvtc -name "nmon" -e nmon -s 5 &
#[ -z "$(pidof mocp)" ] && urxvtc -name "MOCP" -e mocp &
#[ -z "$(pidof saidar)" ] && urxvtc -name "Saidar" -e saidar -c
#[ -z "$(pidof ttyload)" ] && urxvtc -name "TTYload" -e ttyload
urxvtc -name "Logs" -e sudo journalctl -f
#urxvtc -name "IOtop" -e sudo iotop -o

if [ "$WM_NAME" = "awesome" ]; then
	[ -z "$(pidof tail)" ] && urxvtc -name "STDerr" -e tail -f "$HOME/.cache/awesome/stderr"
fi

# Start vlc media player and playlist
if [ -d "$HOME/Videos/tempvideo" ] ; then
	[ -z "$(pidof vlc)" ] && vlc "/home/pdq/Videos/tempvideo" &
fi

# Start text editor
[ -z "$(pidof sublime_text)" ] && subl3 &

# Start gui applications
# [ -z "$(pidof kdenlive)" ] && kdenlive &
[ -z "$(pidof gkrellm)" ] && gkrellm &
[ -z "$(pidof firefox)" ] && firefox &
[ -z "$(pidof dolphin)" ] && dolphin &
#[ -z "$(pidof steam)" ] && steam &
<<<<<<< HEAD
# [ -z "$(pidof nvidia-settings)" ] && nvidia-settings &
=======
[ -z "$(pidof nvidia-settings)" ] && nvidia-settings &
>>>>>>> 0a7e24c2894e481ad048a78257189ea764921ed8

# Start systray applications
[ -z "$(pidof dropbox)" ] && dropboxd &
#[ -z "$(pidof nm-applet)" ] && nm-applet & 

# Start update notifier
#killall -q aarchup
#sleep 1s
#[ -z "$(pidof aarchup)" ] && /usr/bin/aarchup --loop-time 60 --aur --icon "$HOME/.config/awesome/icons/pacman_icon_48x48.png" &
#[ -z "$(pidof bitlbee)" ] && sudo bitlbee -D

# Focus tag 1
xdotool key alt+F1
#wmctrl -s 0
