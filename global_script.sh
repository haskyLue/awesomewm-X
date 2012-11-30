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

	[ -z "$(pidof urxvtd)" ] && urxvtd -q -o -f &
	[ -z "$(pidof bitlbee)" ] && sudo bitlbee -D
	[ -z "$(pidof weechat-curses)" ] && urxvtc -name IRC1 -e weechat-curses && urxvtc -name IRC2 -e weechat-curses -d ~/.weechat-priv &
	[ -z "$(pidof xbindkeys)" ] && xbindkeys &
	[ -z "$(pidof htop)" ] && urxvtc -name Htop -e htop &
	[ -z "$(pidof saidar)" ] && urxvtc -name Saidar -e saidar -c &
	[ -z "$(pidof ttyload)" ] && urxvtc name TTYload -e ttyload &
	[ -z "$(pidof journalctl)" ] && urxvtc -name Logs -e sudo journalctl -f &
	[ -z "$(pidof vlc)" ] && vlc "$HOME/Videos/playlist" &
	[ -z "$(pidof sublime_text)" ] && subl && sudo subl &
	[ -z "$(pidof spacefm)" ] && spacefm &
	[ -z "$(pidof firefox)" ] && firefox &
	[ -z "$(pidof dropbox)" ] && dropboxd &
	[ -z "$(pidof urxvtd)" ] && parcellite &
	[ -z "$(pidof transmission-daemon)" ] && sudo systemctl start transmission.service
	[ -z "$(pidof mocp)" ] && urxvtc -name MOCP -e mocp &
	[ -z "$(pidof conky)" ] && urxvtd &
	[ -z "$(pidof conky)" ] && conky -d -c "$HOME"/.config/conky/.bottomrc &
	[ -z "$(pidof httpd)" ] && sudo lamp start
	[ -z "$(pidof aarchup)" ] && /usr/bin/aarchup --loop-time 30 --aur --icon pac_icon &
	
	# some leftover terminals
	#urxvtc -name Test &
	#urxvtc -name Play &
	#urxvtc -name STDerr -e tail -f "$HOME/.cache/awesome/stderr" &
fi
wmctrl -s 0
exit 0