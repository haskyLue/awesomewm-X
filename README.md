awesomewm-X
===========

Configuration files for Awesome Window Manager.

http://awesome.naquadah.org/wiki/Main_Page

https://github.com/idk/awesomewm-X

Depends on: git

Optional:   [mpd][1]


INSTALL Awesome Window Manager
------------------------------

Ubuntu/Debian:

    # apt-get install awesome

Archlinux:

    # pacman -S awesome

Gentoo:

    # emerge -av awesome

Fedora:

    # su -c 'wget -nd -P /etc/yum.repos.d http://repos.fedorapeople.org/repos/thm/awesome/fedora-awesome.repo'
    # su -c 'yum install awesome'


INSTALL Awesomewm-X
-------------------

    $ cd ~/.config
    $ git clone https://github.com/idk/awesomewm-X.git
    $ cp -r awesomewm-X awesome


CONFIGURATION
-------------

    $ nano -w ~/.config/awesome/rc.lua
    $ nano -w ~/.config/awesome/themes/default/theme.lua


USAGE
-----

To run awesome without a login manager, simply add exec awesome to the startup script of your choice (e.g. ~/.xinitrc.)

If you have problems with some devices (like mounting usbkeys, reading dvds) be sure to read documentation about HAL and PolicyKit. When you do not use a login manager, nothing is automated. In some cases, using exec ck-launch-session awesome can solve your problems. For this to work, you must have the [consolekit][2] package installed, otherwise ck-launch-session will be an unrecognised command.

To start awesome from a login manager, see [this article][3].

[SLIM][4] is a popular lightweight login manager and comes highly recommended. You should do like this:

1) Edit /etc/slim.conf for start awesome session, add awesome to sessions line.
For example:

    sessions             awesome,wmii,xmonad

2) Edit ~/.xinitrc file

    DEFAULT_SESSION=awesome
    case $1 in
      awesome|wmii|xmonad) exec $1 ;;
      *) exec $DEFAULT_SESSION ;;
    esac

However, you can also start awesome as preferred user without any login manager and even without logging in, after editing ~/.xinitrc and /etc/inittab properly. Refer to the article [Start X at boot][5]. 


SHARE AND ENJOY!
----------------


TODO
----

automatically check number of cores in use
clean up theme
configuration variable for OS. ie: archlinux, gentoo, ubuntu, fedora

[1]: https://wiki.archlinux.org/index.php/Mpd
[2]: https://wiki.archlinux.org/index.php/ConsoleKit
[3]: https://wiki.archlinux.org/index.php/Display_Manager
[4]: https://wiki.archlinux.org/index.php/SLIM
[5]: https://wiki.archlinux.org/index.php/Start_X_at_boot