awesomewm-X
===========

Configuration files for Awesome Window Manager.

https://www.youtube.com/watch?v=Cbl0vinkg2A&hd=1

https://github.com/idk/awesomewm-X

Depends on: git, [luasocket][9], mpd, mpc, bash-completion, cclive, dmenu, htop, multitail, profont, scrot, artwiz-fonts, terminus-font, xclip, cairo-compmgr-git, conky-lua, montecarlo-font, rxvt-unicode-patched, ttf-envy-code-r and [luainotify][8]

Optional:   [idesk][1]


Step 1: MINIMAL and/or OPTIONAL packages
-----------------------------------------------

`Archlinux:`

Install Minimal required packages (ie: after fresh install):

    # pacman -S  xorg-server xorg-xinit xorg-server-utils consolekit mesa


Install Optional recommended packages:

    # pacman -S git spacefm

    $ packer -S luakit sublime-text


Step 2: INSTALL Awesome Window Manager and misc packages
------------------------------

`Archlinux:`

    # pacman -S awesome luasocket luafilesystem mpd mpc gnome-icon-theme bash-completion cclive dmenu htop multitail profont scrot artwiz-fonts terminus-font xclip
    
    $ packer -S cairo-compmgr-git conky-lua luainotify montecarlo-font rxvt-unicode-patched ttf-envy-code-r


`Cleanup`

    # pacman -Rs docbook2x perl-xml-libxml scons toluapp


Step 3: INSTALL Awesomewm-X
-------------------

    $ cd ~/.config
    $ git clone https://github.com/idk/awesomewm-X.git
    $ git clone https://github.com/idk/conky-X.git
    $ sh awesomewm-X/install.sh

USAGE
-----

`With no login manager`

Reboot, login as normal user and try running 'startx' in the console to start Awesome. 

Your existing ~/.xinitrc will be backed up to ~/.xinitrc.original
 if you run into any problems.

EXPANDED USAGE
--------------

To start awesome from a login manager, see [this article][3].

[SLIM][4] is a popular lightweight login manager and comes highly recommended. You should do like this:

1) Edit `/etc/slim.conf` for start awesome session, add awesome to sessions line.
For example:

    sessions             awesome,wmii,xmonad

2) Edit `~/.xinitrc` file

    DEFAULT_SESSION=awesome
    case $1 in
      awesome|wmii|xmonad) exec $1 ;;
      *) exec $DEFAULT_SESSION ;;
    esac

However, you can also start awesome as preferred user without any login manager and even without logging in, after editing `~/.xinitrc` and `/etc/inittab` properly. Refer to the article [Start X at boot][5]. 


SUPPORT
-------

[The Linux Distro Community][6]

[pdq][7]


TODO
----

1. automatically check number of cores in use
2. clean up theme
3. configuration variable for OS. ie: archlinux, gentoo, ubuntu, fedora


HISTORY
-------

* 2012-07-04: Version 0.0.5

  - Added Xdefaults config in rc.lua
  - Major enhancement: debugger and script execution timer
  - Version enhancement: new menu functions
  - Version enhancement: theme tweaks
  - Version enhancement: configuration tweaks
  - Version enhancement: optimization tweaks

* 2012-07-03: Version 0.0.3

   - Imported lognotify
   - Imported utils
   - Added Xdefaults themes
   - Removed calendar2
   - Major enhancement: added 30 themes and theme switcher
   - Minor enhancement: addition of selectable menu icon
   - Version enhancement: new configuration variables
   - Version enhancement: theme tweaks
   - Version enhancement: configuration tweaks
   - Version enhancement: optimization tweaks

* 2012-06-30: Version 0.0.2

   - Convertion of deprecated wicked widgets to vicious widgets (Armageddon 06-29-2012)
   - Imported calendar2
   - Minor enhancement: fixed home path
   - Minor enhancement: addition of gentoo icon
   - Minor enhancement: bottom bar widget (weather, calendar, total traffic)
   - Version enhancement: new configuration variables
   - Version enhancement: theme tweaks
   - Version enhancement: configuration tweaks
   - Version enhancement: optimization tweaks

* 2012-02-18: Version 0.0.1
      
   - Initial commit
   - Imported awesompd
   - Imported awesome-freedesktop
   - Imported launchbar
   - Imported revelation
   - Imported scratch
   - Imported diskusage
   - Minor enhancement: default tags, tag names and layout
   - Minor enhancement: bottom bar widgets (uptime, load, cpu, memory, net, weather, date)
   - Minor enhancement: relocated systray to bottom bar
   - Version enhancement: new configuration variables
   - Version enhancement: theme tweaks
   - Version enhancement: configuration tweaks


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_awesomewm-X`)
3. Commit your changes (`git commit -am "Added foo and bar"`)
4. Push to the branch (`git push origin my_awesomewm-X`)
5. Create an [Issue][7] with a link to your branch
6. Join the Linux Distro Community IRC or Mumble! :D

SHARE AND ENJOY!
----------------

[1]: https://wiki.archlinux.org/index.php/Mpd
[2]: https://wiki.archlinux.org/index.php/ConsoleKit
[3]: https://wiki.archlinux.org/index.php/Display_Manager
[4]: https://wiki.archlinux.org/index.php/SLIM
[5]: https://wiki.archlinux.org/index.php/Start_X_at_boot
[6]: http://www.linuxdistrocommunity.com
[7]: https://github.com/idk/awesomewm-X/issues
[8]: http://www3.telus.net/taj_khattra/luainotify.html
[9]: http://w3.impa.br/~diego/software/luasocket
[10]: https://wiki.archlinux.org/index.php/idesk
