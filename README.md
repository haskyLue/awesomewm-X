awesomewm-X
===========

Configuration files for Awesome Window Manager.

http://awesome.naquadah.org/wiki/Main_Page

https://github.com/idk/awesomewm-X

Depends on: git [luasocket][9] and [luainotify][8]

Optional:   [mpd][1]


INSTALL Awesome Window Manager
------------------------------

`Ubuntu/Debian:`

    # apt-get install awesome

`Archlinux:`

    # pacman -S awesome

`Gentoo:`

    # emerge -av awesome

`Fedora:`

    # su -c 'wget -nd -P /etc/yum.repos.d http://repos.fedorapeople.org/repos/thm/awesome/fedora-awesome.repo'
    # su -c 'yum install awesome'


INSTALL Awesomewm-X
-------------------

    $ cd ~/.config
    $ git clone https://github.com/idk/awesomewm-X.git
    $ cp -r awesomewm-X awesome
    $ mkdir ~/.config/awesome/Xdefaults/$USER
    $ mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
    $ ln -sfn ~/.config/awesome/Xdefaults/$USER/.Xdefaults ~/.Xdefaults
    $ ln -sfn ~/.config/awesome/themes/pdq ~/.config/awesome/themes/current
    $ ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png


CONFIGURATION
-------------

    $ nano -w ~/.config/awesome/rc.lua
    $ nano -w ~/.config/awesome/themes/current/theme.lua
    
Or in Awesome menu Interface->Edit Config
Or in Awesome menu Interface->Edit Theme


USAGE
-----

To run awesome without a login manager, simply add `exec awesome` to the startup script of your choice (e.g. `~/.xinitrc`.)

If you have problems with some devices (like mounting usbkeys, reading dvds) be sure to read documentation about `HAL` and `PolicyKit`. When you do not use a login manager, nothing is automated. In some cases, using `exec ck-launch-session awesome` can solve your problems. For this to work, you must have the [consolekit][2] package installed, otherwise `ck-launch-session` will be an unrecognised command.

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

* 2012-07-04: Version 0.0.4

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
