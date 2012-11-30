#!/bin/bash
# autostart
# author pdq  11-27-2012
# THEMEDIR=$HOME"/.config/awesome/themes/dunzor"

## SEE $XDG_CONFIG_HOME/awesome/custom/
## If wanting to regenerate every themes script.sh from the default_script.

## Run from terminal:

## sh $XDG_CONFIG_HOME/awesome/custom/script_regeneration.sh

tc1="/media/truecrypt1/test"
tc2="/media/truecrypt2/test"

if [ -f "$tc1" ] && [ -f "$tc2" ]  ; then

	nitrogen --restore &

	if [ -z "$(pidof urxvtd)" ] ; then
		urxvtd &
	fi

	if [ -z "$(pidof bitlbee)" ] ; then
		sudo bitlbee -D
	fi

	if [ -z "$(pidof weechat-curses)" ] ; then
		urxvtc -name IRC1 -e weechat-curses &
		urxvtc -name IRC2 -e weechat-curses -d ~/.weechat-priv &
	fi

	if [ -z "$(pidof xbindkeys)" ] ; then
		xbindkeys &
	fi

	if [ -z "$(pidof htop)" ] ; then
		urxvtc -name Htop -e htop &
	fi

	if [ -z "$(pidof saidar)" ] ; then
		urxvtc -name Saidar -e saidar -c &
	fi

	if [ -z "$(pidof ttyload)" ] ; then
		urxvtc name TTYload -e ttyload &
	fi

	if [ -z "$(pidof journalctl)" ] ; then
	    urxvtc -name Logs -e sudo journalctl -f &
	fi

	if [ -z "$(pidof htop)" ] ; then
		urxvtc -name Htop -e htop &
	fi

	if [ -z "$(pidof vlc)" ] ; then
	    vlc "$HOME/Videos/playlist" &
	fi

	if [ -z "$(pidof sublime_text)" ] ; then
		subl &
		sudo subl &
	fi

	if [ -z "$(pidof spacefm)" ] ; then
		spacefm &
	fi

	if [ -z "$(pidof firefox)" ] ; then
		firefox &
	fi

	if [ -z "$(pidof dropbox)" ] ; then
		dropboxd &
	fi

	if [ -z "$(pidof parcellite)" ] ; then
		parcellite &
	fi

	if [ -z "$(pidof transmission-daemon)" ] ; then
		#transmission-qt > /dev/null 2>&1 &
		sudo systemctl start transmission.service
	fi

	if [ -z "$(pidof mocp)" ] ; then
		urxvtc -name MOCP -e mocp &
	fi

	if [ -z "$(pidof conky)" ] ; then
		conky -d -c "$HOME"/.config/conky/.bottomrc &
	else
		killall conky
		conky -d -c "$HOME"/.config/conky/.bottomrc &
	fi

	if [ -z "$(pidof httpd)" ] ; then
		sudo lamp start
	fi

	if [ -z "$(pidof aarchup)" ] ; then
		/usr/bin/aarchup --loop-time 30 --aur --icon pac_icon &
	fi

	# some leftover terminals
	urxvtc -name Test &
	urxvtc -name Play &
	urxvtc -name STDerr -e tail -f "$HOME/.cache/awesome/stderr" &
fi
wmctrl -s 0
exit 0