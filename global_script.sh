#!/bin/bash
# autostart
# author pdq 11-27-2012
# THEMEDIR=$HOME"/.config/awesome/themes/dunzor"

## SEE $XDG_CONFIG_HOME/awesome/custom/
## If wanting to regenerate every themes script.sh from the default_script.

## Run from terminal:

## sh $XDG_CONFIG_HOME/awesome/custom/script_regeneration.sh

tc1="/media/truecrypt1/test"
tc2="/media/truecrypt2/test"

if [ -f "$tc1" ] && [ -f "$tc2" ] || [ "$USER" != "pdq" ] ; then

	if [ ! -z $DISPLAY ]; then
		WM_WINDOW=$(xprop -root _NET_SUPPORTING_WM_CHECK)
		WM_WINDOW=${WM_WINDOW##* }
		WM_NAME=$(xprop -id $WM_WINDOW 8s _NET_WM_NAME)
		WM_NAME=${WM_NAME##* }
		WM_NAME=`echo $WM_NAME | sed 's/\"//g'`
	else
		WM_NAME=""
	fi

	if [ "$WM_NAME" = "awesome" ]; then
		[ -z "$(pidof compton)" ] && compton -cF &
		sleep 2s
		feh --bg-scale $HOME/Pictures/wallpaper/1088253-bludragon.jpg &
		#sh ~/bin/rotate_wallpaper &
	else
		## start drop down terminal emulator
		[ -z "$(pidof stjerm)" ] && stjerm -k f12 -o 80 -fg 66ff11 -ah false -sh /bin/sh -l 7000 -h 350 &
	fi
	
	# start IM server and IRC client
	[ -z "$(pidof bitlbee)" ] && sudo bitlbee -D
	[ -z "$(pidof weechat-curses)" ] && urxvtc -name "IRC1" -e weechat-curses && urxvtc -name "IRC2" -e weechat-curses -d ~/.weechat-priv
	
	## start custom keyboard shortcuts
	[ -z "$(pidof xbindkeys)" ] && xbindkeys &
	
	# start terminal apps
	[ -z "$(pidof htop)" ] && urxvtc -name "Htop" -e htop
	#[ -z "$(pidof saidar)" ] && urxvtc -name "Saidar" -e saidar -c
	#[ -z "$(pidof ttyload)" ] && urxvtc -name "TTYload" -e ttyload
	#sudo killall journalctl && urxvtc -name "Logs" -e sudo journalctl -f

	if [ "$WM_NAME" = "awesome" ]; then
		[ -z "$(pidof tail)" ] && urxvtc -name "STDerr" -e tail -f "$HOME/.cache/awesome/stderr"
	fi
	
	#start vlc media player and playlist
	if [ -d "$HOME/Videos/playlist" ] ; then
		[ -z "$(pidof vlc)" ] && vlc "$HOME/Videos/playlist" /dev/null 2>&1 &
	fi

	# start text editor
	[ -z "$(pidof sublime_text)" ] && subl

	# start gui applications
	#[ -z "$(pidof spacefm)" ] && spacefm &
	[ -z "$(pidof firefox)" ] && firefox /dev/null 2>&1 &
	
	# start systray applications
	#[ -z "$(pidof dropbox)" ] && dropboxd &
	killall aarchup
	sleep 2s
	[ -z "$(pidof aarchup)" ] && /usr/bin/aarchup --loop-time 60 --aur --icon "$HOME/.config/awesome/icons/pacman_icon_48x48.png" &

	# start daemons and services not auto started at boot
	#[ -z "$(pidof httpd)" ] && sudo lamp.sh start
	[ -z "$(pidof transmission-daemon)" ] && sudo systemctl start transmission.service
	#[ -z "$(pidof mocp)" ] && urxvtc -name "MOCP" -e mocp &
	
	# start system information display
	#killall conky
	#sleep 2s
	[ -z "$(pidof conky)" ] && conky -d -c "$HOME"/.config/conky/.conkye17 /dev/null 2>&1 &

fi

# focus tag 1
#wmctrl -s 0

# exit cleanly
exit 0
