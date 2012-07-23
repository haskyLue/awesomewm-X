-- https://github.com/idk/awesomewm-X  https://github.com/idk/pdq
-- BASIC CONFIGURATION begins on line 70
local debug = true -- true/false (default true)
if debug then
    local socket = require('socket') -- luasocket
    local timer = timer
    timer.start = socket.gettime() -- debug
end

-- Require libraries
require('awful')
require('awful.autofocus')
require('awful.rules')
require('beautiful')
require('naughty')
local vicious = require('vicious') -- http://awesome.naquadah.org/wiki/Vicious

-- Local libraries
require('freedesktop.utils') -- https://github.com/terceiro/awesome-freedesktop
require('freedesktop.menu') 
require('awesompd/awesompd') -- awesome.naquadah.org/wiki/Awesompd_widget

local req = {
    awmXversion = '0.0.5',
    revelation = require('revelation'), -- http://awesome.naquadah.org/wiki/Revelation
    scratch = require('scratch'),       -- http://awesome.naquadah.org/wiki/Revelation
    lognotify = require('lognotify'),	-- https://github.com/Mic92/lognotify
    lfs = require('lfs'),
    utils = require('utils'),
    disk = require('diskusage'),
    -- calendar widget
    cal = utils.cal,
    -- wrapper for pango markup
    markup = utils.markup,
}

if debug then
    timer.libs = socket.gettime() -- debug
    timer.libsdiff = timer.libs-timer.start
end

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
   naughty.notify({ preset = naughty.config.presets.critical,
                    title = 'Oops, there were errors during startup!',
                    text = awesome.startup_errors })
end
-- Handle runtime errors after startup
do
   local in_error = false
   awesome.add_signal('debug::error', function (err)
      -- Make sure we don't go into an endless error loop
      if in_error then return end
      in_error = true
      naughty.notify({ preset = naughty.config.presets.critical,
                       title = 'Oops, an error happened!',
                       text = err })
      in_error = false
    end)
end

-- grab cpu core count for widgets
local f = io.popen('grep -c ^processor /proc/cpuinfo', 'r')
local cpuinfo = tonumber(f:read('*a'))
f:close()

home_path  = os.getenv('HOME') .. '/'

-- START BASIC CONFIGURATION -- (* reload awesome when make any changes below)
script_options = {
               idesk = false,         -- use idesk (default false)
            -- global = true,         -- comment to use per theme script (default commented) or global script ~/.config/awesome/global_script.sh
               -- wallpaper = true,      -- theme changes wallpaper (default true) unless global uncommented then uses ~/.config/awesome/global_wallpaper.jpg
               conky_1 = true,        -- (default true) ~/.config/conky/.conkyrc
               conky_2 = true,        -- (default true) ~/.config/conky/conky_grey/conkyrc_grey
               linux = 'archlinux',   -- archlinux/debian/fedora/gentoo/
               email = true,          -- (default false) ~/.config/conky/unread_email.sh
           --  font = 'Terminus 8',          -- comment to use themes settings
               taglist_font = 'Terminus 12', -- comment to use themes settings
               border_width = 0,
             }

-- DO NOT EDIT THIS SECTION START --
str1 = script_options.idesk and ' idesk ' or ''
str2 = script_options.wallpaper and ' wp ' or ''
str3 = script_options.conky_1 and ' conky ' or ''
str4 = script_options.conky_2 and ' eng ' or ''
str5 = script_options.linux  and ' ' .. script_options.linux .. ' ' or ''
str6 = script_options.email and ' email ' or ''
script_run = string.format('%s%s%s%s%s%s', str1, str2, str3, str4, str5, str6);

-- Themes define colours, icons, and wallpapers
local theme_path = home_path  .. '.config/awesome/themes/current/theme.lua' -- DO NOT modify
beautiful.init(theme_path)
-- DO NOT EDIT THIS SECTION END --

usr = {
    terminal      = 'urxvtc', -- requires urxvt daemon: 'urxvtd -q -o -f'
    terminal_cmd  = 'urxvtc -e ',
    editor        = 'subl', -- nano vim gedit geany sublime etc.
    gui_editor    = true, -- terminal or gui based. (true/false)
    terminal_font = "URxvt*font: xft:terminus:pixelsize=16:antialias=false\n" ..
                 -- "!URxvt*font: xft:Envy Code R-10\n" ..
                    "URxvt*iconFile: /usr/share/icons/gnome/24x24/apps/terminal.png\n" ..
                    "URxvt*background: #000000\n" .. -- black
                    "URxvt*foreground: #d3d3d3\n" .. -- white
                    "URxvt*transparent: false\n" .. 
                    "URxvt*perl-ext-common:	default,clipboard,matcher,\n" ..
                    "*underlineColor: #de5105\n",
    poweroff   = 'sudo /sbin/poweroff',
    reboot     = 'sudo /sbin/reboot',
 -- hibernate  = 'sudo /usr/sbin/pm-hibernate',
 -- suspend    = 'sudo /usr/sbin/pm-suspend',
    aur_helper = 'cower -fud',
 -- gui_sudo   = 'kdesu', -- sudo command for gui applications (gksudo, kdesu)
    file_manager = {
        -- 'DISABLED', -- uncomment this out to hide menu entries
           'dolphin',
        -- 'Thunar',
           'spacefm',
        -- 'pcmanfm,
    },
    web_browser = {
           'DISABLED', -- uncomment this out to hide menu entries
        -- 'firefox'
        -- 'firefox-beta-bin',
        -- 'chromium',
        -- 'opera',
        -- 'midori',
        -- 'luakit',
    },
    primary_browser = -- 'firefox',
                         'luakit',
    screen_width = 
        --  1024 -- 1024 and below
        --  1152 -- 1025-1152
        --  1280 -- 1153-1280
        --  1368 -- 1281-1368
            1440 -- 1369-1440 (default)
        --  1680 -- 1441-1680
        --  1920 -- 1681 and above
    ,
    top_wibox    = 18, -- default 15 (height)
    bottom_wibox = 18, -- default 15 (height)
    networks     = { 'eth0', 'wlan0' }, -- Add your devices network interfaces here
    uptimewidget_enable    = true,
    cpuwidget_enable       = true,
    memwidget_enable       = true,
    netwidget_enable       = true,
    diskusagewidget_enable = true,
    weatherwidget_enable   = true,
    datewidget_enable      = true,
    batterywidget_enable   = false,
    pacmanwidget_enable    = true, 
    aurwidget_enable       = true,
    debug_clients          = false, -- useful for \client rules setup
    weather_code  =  'CYWG', -- 'CYWG' -- ICAO code
    date_format   = '%a %h %d %l:%M%p', -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers
    launcher_path = home_path .. '.config/awesome/launcher/', -- no need to change
    -- http://awesome.naquadah.org/wiki/Move_Mouse
    -- set the desired pixel coordinates:
    --  if your screen is 1440x900 the this line sets the bottom right.
    -- local safeCoords = { x = 1440, y = 900 }
    -- if your screen is 1440x900 the this line sets the bottom left.
    -- safeCoords = { x = 0, y = 900 },
    -- safeCoords = { x = 720, y = 0 }
    safeCoords = { x = 0, y = 0 }, -- top left
    -- Flag to tell Awesome whether to do this at startup.
    moveMouseOnStartup = true,
    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt(Mod1).
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey   = 'Mod4', -- change to Mod1 (Alt)if using Virtualbox
    mod_key  = {
        up   = { 'Up', 'k' },
        down = { 'Down', 'j' },
        back = { 'Left', 'x', 'h' },
    },
    exec = awful.util.spawn,
 -- sexec  = awful.util.spawn_with_shell,
}

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
   awful.layout.suit.floating,        -- 1
   awful.layout.suit.tile,            -- 2
   awful.layout.suit.tile.left,       -- 3
   awful.layout.suit.max,             -- 4
-- awful.layout.suit.max.fullscreen,  -- 11
-- awful.layout.suit.magnifier        -- 12
}

-- Tags
local tags = {
--  names  = { '1:Web', '2:Chat', '3:Logs', '4:Video', 
--             '5:Video2', '6:Dev', '7:---', '8:---' },
    names = { '☠', '⌥', '✇', '⌤', '⍜', '⌨', '⚡', '✣' },
--  names = { '☭', '⌥', '✇', '⌤', '☼', '⌘', '⍜', '☠' },
--  names = { '♨', '⌨', '⚡', '✉', '❁', '☃', '☄', '⚢' },
--  names = { '➊', '➋', '➌', '➍', '➎', '➏', '➐', '➑' },

    layout = {
      layouts[4],  -- 1:firefox 10
      layouts[3],  -- 2:weechat/pidgin
      layouts[3],  -- 3:logs/bots/shells
      layouts[3],  -- 4:media playing
      layouts[1],  -- 5:media editing
      layouts[3],  -- 6:projects/development
      layouts[1],  -- 7:shells
      layouts[1]   -- 8:shells
            }
        }

for s = 1, screen.count() do
   -- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- END BASIC CONFIGURATION --

if usr.gui_editor then
   editor_cmd = usr.editor
-- su_editor_cmd = usr.gui_sudo .. ' ' .. usr.editor
else
   editor_cmd = usr.terminal_cmd .. usr.editor
-- su_editor_cmd = usr.terminal_cmd .. 'sudo ' .. usr.editor
end
local sudo_bash = usr.terminal_cmd .. 'sudo bash '

-- write terminal font options to .Xdefaults
local f = io.open(home_path .. '.config/awesome/.urxvt_font', 'w+')
local t = f:write(usr.terminal_font)
f:close()

if debug then
    timer.usr = socket.gettime() -- debug
    timer.usrdiff = timer.usr-timer.libs
end

-- Screen width widget modifiers by pdq 07-13-2012
if usr.screen_width >= 599 and usr.screen_width < 1151 then
    modifier = {
        seperator_min = 5,
        seperator_max = 10,
        uptime_text   = 'UP: ', 
        cpu_text      = 'CPU: ',
        cpu_w         = 60,
        cpuw_width    = 15,
        mem_text      = 'RAM: ', 
        net_text      = 'NET: ',
        net_text2     = 'TT: ',
        du_text       = 'DU',
    }
elseif usr.screen_width >= 1152 and usr.screen_width < 1440 then
    modifier = {
        seperator_min = 10,
        seperator_max = 10,
        uptime_text   = 'UP: ', 
        cpu_text      = 'CPU: ',
        cpu_w         = 60,
        cpuw_width    = 15,
        mem_text      = 'RAM: ', 
        net_text      = 'NET: ',
        net_text2     = 'TT: ',
        du_text       = 'DU',
    }
elseif usr.screen_width >= 1440 and usr.screen_width < 1680 then
    modifier = {
        seperator_min = 10,
        seperator_max = 20,
        uptime_text   = 'Uptime: ', 
        cpu_w         = 75,
        cpu_text      = 'Cores: ',
        cpuw_width    = 30,
        mem_text      = 'Memory: ', 
        net_text      = 'Traffic: ',
        net_text2     = 'Total: ',
        du_text       = 'Diskusage',
    --  extra_widgets = true
    }
elseif usr.screen_width >= 1680 then
    modifier = {
        seperator_min = 10,
        seperator_max = 20,
        uptime_text   = 'Uptime: ', 
        cpu_w         = 75,
        cpu_text      = 'Cores: ',
        cpuw_width    = 30,
        mem_text      = 'Memory: ', 
        net_text      = 'Traffic: ',
        net_text2     = 'Total Traffic: ',
        du_text       = 'Diskusage',
        extra_widgets = true
    }
end

-- Create a laucher widget and a main menu
freedesktop.utils.icon_theme = beautiful.menu_icons
local menu_items = freedesktop.menu.new()

-- themes menu
local thememenu = {}
local function theme_load(theme)
   usr.exec('ln -sfn ' .. home_path .. '.config/awesome/themes/' .. theme .. ' ' .. home_path .. '.config/awesome/themes/current')
   awesome.restart()
end
local function theme_menu()
   local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/themes/')
   for l in f:lines() do
	  local item = { l, function () theme_load(l) end }
	  table.insert(thememenu, item)
   end
   f:close()
end
theme_menu()

-- menu icon menu pdq 07-02-2012
local iconmenu = {}
local function icon_load(icon)
   usr.exec('ln -sfn ' .. home_path .. '.config/awesome/icons/' .. icon .. ' ' .. home_path .. '.config/awesome/icons/menu_icon.png')
   awesome.restart()
end
local function icon_menu()
   local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/icons/')
   for l in f:lines() do
	  local item = { l, function () icon_load(l) end }
	  table.insert(iconmenu, item)
   end
   f:close()
end
icon_menu()

-- menu item function for awesome pdq -07-03-2012
function usr_menu_item(usr_entry, usr_icon)
   for key, usr_item in pairs(usr_entry) do
      if usr_item == 'DISABLED' then
         break
      end
      usr_menu_entry = usr_item:gsub("^%l", string.upper)
      table.insert(menu_items, { usr_menu_entry, usr_item, freedesktop.utils.lookup_icon({icon = usr_icon}) })
   end
end

local myawesomemenu = { 
   { 'Awesome Help', 'xdg-open http://awesome.naquadah.org/doc/manpages/awesome.1.html', freedesktop.utils.lookup_icon({ icon = 'help' }) },
   { 'Themes', thememenu, freedesktop.utils.lookup_icon({ icon = 'style' }) },
   { 'Menu icon', iconmenu, freedesktop.utils.lookup_icon({ icon = 'style' }) },
   { 'Edit Current config', editor_cmd .. ' ' .. awesome.conffile, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Edit Current theme', editor_cmd .. ' ' .. theme_path, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Edit Current script', editor_cmd .. ' ' .. home_path .. '.config/awesome/themes/current/script.sh', freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Debug Awesome', usr.terminal_cmd .. 'tail -f ' .. home_path .. '.cache/awesome/stderr', freedesktop.utils.lookup_icon({ icon = 'help' }) },
   { 'Test Awesome', '/bin/bash ' .. home_path .. '.config/awesome/bin/awesome_test', freedesktop.utils.lookup_icon({ icon = 'help' }) },
   -- { 'Preferred Apps' , 'exo-preferred-applications', freedesktop.utils.lookup_icon({ icon = 'help' })},
   { 'Reload', awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Logout', awesome.quit, freedesktop.utils.lookup_icon({ icon = 'system-log-out' })},
   { 'Shutdown' , usr.poweroff, freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })},
   { 'Reboot' , usr.reboot, freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })}
}

local servicesmenu = {
   { 'Transmission On', usr.terminal_cmd .. 'transmission-daemon -g ' .. home_path .. '.config/transmission', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Transmission Off', usr.terminal_cmd .. 'killall transmission-daemon', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP On', sudo_bash .. 'lamp start', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP Off', sudo_bash .. 'lamp stop', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'MPD On', sudo_bash .. 'rc.d start mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'MPD Off', sudo_bash .. 'rc.d stop mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   -- { 'rtorrent On', usr.terminal_cmd .. 'tmux new-window rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   -- { 'rtorrent Off', usr.terminal_cmd .. 'killall rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) }
}

table.insert(menu_items, { 'Awesome Options', myawesomemenu,  freedesktop.utils.lookup_icon({icon = 'help'}) })

-- Add script options pdq 07-05-2012
if script_options.idesk or script_options.conky_1 or script_options.conky_2 or script_options.email then
    myideskmenu = {
        { 'Appearance', 'lxappearance', freedesktop.utils.lookup_icon({ icon = 'style' }) },
        { 'Wallpaper', 'nitrogen', freedesktop.utils.lookup_icon({ icon = 'style' }) },
        { 'Kill Conky', usr.terminal_cmd .. 'killall conky', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' }) },
        { 'Kill Idesk', usr.terminal_cmd .. 'killall idesk', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' }) },
        { 'Start Conky', '/bin/bash ' .. home_path .. '.config/awesome/themes/current/script.sh ' .. script_run, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
        { 'Start Idesk', 'idesk', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) }
    }
    table.insert(menu_items, { 'Desktop Options', myideskmenu,  freedesktop.utils.lookup_icon({icon = 'help'}) })
end

table.insert(menu_items, { 'Services', servicesmenu, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) })

-- Add menu items for web browsers pdq 07-03-2012
usr_menu_item(usr.web_browser, 'web-browser')

table.insert(menu_items, { 'Task Manager', 'lxtask', freedesktop.utils.lookup_icon({icon = 'gnome-monitor.png'}) })
table.insert(menu_items, { 'Terminal', usr.terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

-- Xdefaults menu pdq 07-02-2012
if usr.terminal == 'urxvtc' then
	local xftmenu = {}
	local function xft_load(xft_file)
	   usr.exec('ln -sfn ' .. home_path .. '.config/awesome/Xdefaults/' .. xft_file .. '/.Xdefaults ' .. home_path .. '.Xdefaults')
	   usr.exec('xrdb ' .. home_path .. '.Xdefaults')
	   usr.exec('killall urxvtd')
	   usr.exec('urxvtd -q -o -f')
	end
	local function xft_menu()
	   local f = io.popen('ls -1 ' .. home_path .. '.config/awesome/Xdefaults/')
	   for l in f:lines() do
		  local item = { l, function () xft_load(l) end }
		  table.insert(xftmenu, item)
	   end
	   f:close()
	end
	xft_menu()
	table.insert(menu_items, { 'Xdefaults', xftmenu, freedesktop.utils.lookup_icon({icon = 'terminal'}) })
end

-- Add menu items for file managers pdq 07-03-2012
usr_menu_item(usr.file_manager, 'file-manager')

local mymainmenu = awful.menu.new({ items = menu_items, width = 150 })
local mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu })

if debug then
    timer.menu = socket.gettime() -- debug
    timer.menudiff = timer.menu-timer.usr
end

-- Create a textclock widget
local datewidget = widget({ type = 'textbox', name = 'datewidget' })
vicious.register(datewidget, vicious.widgets.date, usr.date_format, 61)
-- Calendar tooltip
--req.cal.register(datewidget, req.markup.fg(beautiful.fg_focus, '<b>%s</b>'))

local orglendar = require('orglendar')
orglendar.files = { home_path .. '.config/awesome/custom/work.org', -- Specify here all files you want to be parsed, separated by comma
                    home_path .. '.config/awesome/custom/home.org' }
orglendar.register(datewidget)

-- Create a systray
local mysystray = widget({ type = 'systray' })

-- Disk useage widget http://jasonmaur.com/awesome-wm-widgets-configuration/#disk-usage
local diskwidget = widget({ type = 'textbox' })
diskwidget.text = modifier.du_text
awful.widget.layout.margins[diskwidget] = { right = modifier.seperator_max }
diskwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'multitail -ci white /var/log/kernel.log -cis yellow /var/log/pacman.log -ci red /var/log/boot -cis green /home/pdq/.xplanetFX/logs/xplanetFX.log -ci red /var/log/Xorg.0.log -cis green /var/log/httpd/access_log -ci red -I /var/log/httpd/error_log -cis red -I /var/log/httpd/error_log') end ) ) )
-- the first argument is the widget to trigger the diskusage
-- the second/third is the percentage at which a line gets orange/red
-- true = show only local filesystems
req.disk.addToWidget(diskwidget, 75, 90, true)

-- pacman update widget based off setkeh Awesome-Widget-Notify
pacmanwidget = widget({ type = 'textbox' })
awful.widget.layout.margins[pacmanwidget] = { right = modifier.seperator_max }
-- button to run pacman update
pacmanwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'sh ' .. home_path .. 'bin/pacupdater') end ) ) )
local t = timer( {timeout = 1800} )
t:add_signal('timeout', function()
    local f = io.popen('echo Pacman: $(pacman -Qqu | wc -l | tail)', 'r')
    local s = f:read('*a')
    f:close()
    pacmanwidget.text = s
end)
t:emit_signal('timeout')
t:start()

-- aur update widget based off setkeh Awesome-Widget-Notify
local aurwidget = widget({ type = 'textbox' })
awful.widget.layout.margins[aurwidget] = { right = modifier.seperator_max }
-- button to run packer update
aurwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'sh ' .. home_path .. 'bin/packerupdater') end ) ) )
local t = timer({ timeout = 1800 })
t:add_signal('timeout', function()
    local f = io.popen('echo AUR: $(' .. usr.aur_helper .. ' | wc -l | tail)', 'r')
    local s = f:read('*a')
    f:close()
    aurwidget.text = s
end)
t:emit_signal('timeout')
t:start()

local wakka = {}
local capi = { mouse = mouse, screen = screen }

-- formats the lines for the notify
local function display(aur) -- true/false
    if aur then
        lines = "<u>AUR Updates:</u>\n"
        f = io.popen(usr.aur_helper, 'r')
    else
        lines = "<u>Pacman Updates:</u>\n"
        f = io.popen('pacman -Qqu', 'r')
    end
    -- s = f:read('*a') and s or 'No updates available'
    s = f:read('*a')
    local line = lines .. "\n" .. s .. "\n"
    f:close()
    return line
end

function wakka(mywidget, aur)
    mywidget:add_signal('mouse::enter', function ()
        usage = naughty.notify({
            text = string.format('<span font_desc="%s">%s</span>', beautiful.font, display(aur)),
            timeout = 0,
            hover_timeout = 0.5,
            screen = capi.mouse.screen
        })
    end)
    mywidget:add_signal('mouse::leave', function () naughty.destroy(usage) end)
end

wakka(pacmanwidget, false)
wakka(aurwidget, true)

-- Weather widget
local forecast = widget({ type = 'textbox', name = 'weather' })
awful.widget.layout.margins[forecast] = { right = modifier.seperator_max }
local weather_t = awful.tooltip({ objects = { forecast },})
vicious.register(forecast, vicious.widgets.weather, function (widget, args) 
                                                      weather_t:set_text("City: " .. 
                                                      args["{city}"] .. "\nTemperature: " .. 
                                                      args["{tempc}"] .. " °C\t" .. 
                                                      args["{tempf}"] .. " °F " .. "\nWind Condition: " .. 
                                                      args["{wind}"] .. "\nWind Speed: " .. 
                                                      args["{windkmh}"] .. " km/h\t" .. 
                                                      args["{windmph}"] .. " mph\t" .. "\nSky: " .. 
                                                      args["{sky}"] .. "\nHumidity: " .. 
                                                      args["{humid}"] .. "%\n" .. "Pressure: " .. 
                                                      args["{press}"] .. " hPa") 
                                                   return args["{tempc}"] .. ' °C' end, 1800, usr.weather_code)

-- {{{ awesome.naquadah.org/wiki/Awesompd_widget
local musicwidget = awesompd:create() -- Create awesompd widget
musicwidget.widget.bg = beautiful.bg_normal
musicwidget.fg = beautiful.fg_normal
musicwidget.font = beautiful.font -- Set widget font 
musicwidget.scrolling = true -- If true, the text in the widget will be scrolled
musicwidget.output_size = 30 -- Set the size of widget in symbols
musicwidget.update_interval = 10 -- Set the update interval in seconds
-- Set the folder where icons are located (change username to your login name)
musicwidget.path_to_icons = home_path .. '.config/awesome/awesompd/icons' 
-- Set the default music format for Jamendo streams. You can change
-- this option on the fly in awesompd itself.
-- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG
musicwidget.jamendo_format = awesompd.FORMAT_MP3
-- If true, song notifications for Jamendo tracks and local tracks will also contain 
-- album cover image.
musicwidget.show_album_cover = true
-- Specify how big in pixels should an album cover be. Maximum value is 100.
musicwidget.album_cover_size = 50
-- This option is necessary if you want the album covers to be shown for your local tracks.
musicwidget.mpd_config = home_path .. '.mpdconf'
-- Specify the browser you use so awesompd can open links from Jamendo in it.
musicwidget.browser = usr.web_browser
-- Specify decorators on the left and the right side of the
-- widget. Or just leave empty strings if you decorate the widget from outside.
musicwidget.ldecorator = ' ♫ '
musicwidget.rdecorator = ' ♫ '
-- Set all the servers to work with (here can be any servers you use)
musicwidget.servers = {
  { server = 'localhost',
    port = 6600 } 
}
-- Set the buttons of the widget
musicwidget:register_buttons({ { '', awesompd.MOUSE_LEFT, musicwidget:command_toggle() },
                            { 'Control', awesompd.MOUSE_SCROLL_UP, musicwidget:command_prev_track() },
                            { 'Control', awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_next_track() },
                            { '', awesompd.MOUSE_SCROLL_UP, musicwidget:command_volume_up() },
                            { '', awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_volume_down() },
                            { '', awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
                            { '', 'XF86AudioLowerVolume', musicwidget:command_volume_down() },
                            { '', 'XF86AudioRaiseVolume', musicwidget:command_volume_up() },
                            { usr.modkey, 'Pause', musicwidget:command_playpause() } })
musicwidget:run() -- After all configuration is done, run the widget

-- Quick launch bar widget https://awesome.naquadah.org/wiki/Quick_launch_bar_widget
local function getValue(t, key)
   _, _, res = string.find(t, key .. " *= *([^%c]+)%c")
   return res
end

local function split (s,t)
   local l = {n=0}
   local f = function (s)
      l.n = l.n + 1
      l[l.n] = s
   end
   local p = "%s*(.-)%s*"..t.."%s*"
   s = string.gsub(s,p,f)
   l.n = l.n + 1
   return l
end

local launchbar = { layout = awful.widget.layout.horizontal.rightleft }
local files = split(io.popen('ls ' .. usr.launcher_path .. '*.desktop'):read('*all'),"\n")
for i = 1, table.getn(files) do
   local t = io.open(files[i]):read('*all')
   launchbar[i] = { image = image(getValue(t,'Icon')),
                    command = getValue(t,'Exec'),
 --                   tooltip = getValue(t,'Name'),
                    position = tonumber(getValue(t,'Position')) or 255 }
end

table.sort(launchbar, function(a,b) return a.position < b.position end)
for i = 1, table.getn(launchbar) do
   local txt = launchbar[i].tooltip
   launchbar[i] = awful.widget.launcher(launchbar[i])
--   local tt = awful.tooltip ({ objects = { launchbar[i] } })
--   tt:set_text (txt)
--   tt:set_timeout (0)
end

-- load avg / cpu widget
local cpuwidget = widget({ type = 'textbox', name = 'cpuwidget' })
cpuwidget.width = modifier.cpu_w
vicious.register(cpuwidget, vicious.widgets.cpu, modifier.cpu_text .. '$1%')
-- button to launch htop
cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec ( usr.terminal_cmd .. 'htop --sort-key PERCENT_CPU') end ) ) )

-- function cpu_widgets(cores)
--     for i=1, cores do
--   --     end
-- end

local cpugraphwidget = awful.widget.graph()
cpugraphwidget:set_width(modifier.cpuw_width)
cpugraphwidget:set_background_color(beautiful.bg_graphs)
cpugraphwidget:set_gradient_angle(0):set_gradient_colors({ beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget})
vicious.register(cpugraphwidget, vicious.widgets.cpu, "$1")

local cpugraphwidget1 = awful.widget.graph()
cpugraphwidget1:set_width(modifier.cpuw_width)
cpugraphwidget1:set_background_color(beautiful.bg_graphs)
cpugraphwidget1:set_gradient_angle(0):set_gradient_colors({ beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget})
vicious.register(cpugraphwidget1, vicious.widgets.cpu, "$2")

local cpugraphwidget2 = awful.widget.graph()
cpugraphwidget2:set_width(modifier.cpuw_width)
cpugraphwidget2:set_background_color(beautiful.bg_graphs)
cpugraphwidget2:set_gradient_angle(0):set_gradient_colors({ beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget})
vicious.register(cpugraphwidget2, vicious.widgets.cpu, "$3")

local cpugraphwidget3 = awful.widget.graph()
cpugraphwidget3:set_width(modifier.cpuw_width)
cpugraphwidget3:set_background_color(beautiful.bg_graphs)
cpugraphwidget3:set_gradient_angle(0):set_gradient_colors({ beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget})
vicious.register(cpugraphwidget3, vicious.widgets.cpu, "$4")

-- net widget
local function network_info(name, down, up, totaldown, totalup)
    return modifier.net_text .. '↓ ' .. down .. 'mb/s ↑ ' .. up .. 'kb/s  ' .. 
           modifier.net_text2 .. '↓ ' .. 
           totaldown .. 'GiB ↑ ' .. totalup .. 'GiB'
end

local netwidget = widget({ type = 'textbox', name = 'netwidget', align = 'left' })
-- netwidget.width = 400
vicious.register(netwidget, vicious.widgets.net,
function (widget, args)
    for _,device in pairs(usr.networks) do
        if tonumber(args["{".. device .." carrier}"]) > 0 then
            return network_info(device, args["{"..device .." down_mb}"], 
                   args["{"..device.." up_kb}"], args["{"..device .." rx_gb}"], 
                   args["{"..device.." tx_gb}"])
        end
    end
end, 3)

-- vicious.widgets.uptime
  -- provides system uptime and load information
  -- returns 1st value as uptime in days, 2nd as uptime in hours, 3rd
  --  as uptime in minutes, 4th as load average for past 1 minute, 5th
  --  for 5 minutes and 6th for 15 minutes
local uptimewidget = widget({ type = 'textbox' })
vicious.register(uptimewidget, vicious.widgets.uptime, modifier.uptime_text .. '$1d $2:$3, $4, $5, $6', 60)
awful.widget.layout.margins[uptimewidget] = { left = modifier.seperator_min, right = modifier.seperator_max }
-- button to restart awesome
uptimewidget:buttons(awful.util.table.join(awful.button({}, 1, function () awesome.restart() end ) ) )

-- memory widget
local memwidget = widget({ type = 'textbox', name = 'memwidget' })
vicious.register(memwidget, vicious.widgets.mem, modifier.mem_text .. '$1% $2MB/$3MB')
awful.widget.layout.margins[memwidget] = { left = modifier.seperator_max, right = modifier.seperator_min }
memwidget:buttons(awful.util.table.join(awful.button({}, 1, function () usr.exec( usr.terminal_cmd .. 'htop --sort-key PERCENT_MEM') end ) ) )
local memgraphwidget = awful.widget.progressbar()
memgraphwidget:set_vertical(true):set_ticks(true)
memgraphwidget:set_width(modifier.cpuw_width):set_ticks_size(2)
memgraphwidget:set_background_color(beautiful.bg_graphs)
memgraphwidget:set_gradient_colors({ beautiful.fg_widget, beautiful.fg_center_widget, beautiful.fg_end_widget})
vicious.register(memgraphwidget, vicious.widgets.mem, '$1', 5)
awful.widget.layout.margins[memgraphwidget] = { left = 0, right = modifier.seperator_max }

-- Simple function to move the mouse to the coordinates set above.
local function moveMouse(x_co, y_co)
    mouse.coords({ x=x_co, y=y_co })
end
-- Optionally move the mouse when rc.lua is read (startup)
if usr.moveMouseOnStartup then
    moveMouse(usr.safeCoords.x, usr.safeCoords.y)
end

-- Naughty log notify
ilog = req.lognotify {
   logs = {
      mpd = { file = home_path ..'.mpd/log', ignore = {'player_thread: played'} },
      pacman = { file = '/var/log/pacman.log', },
      syslog = { file = '/var/log/syslog.log', },
      kernel = { file = '/var/log/kernel.log', ignore = {'Mark'} },
      php = { file = '/var/log/httpd/error_log' },
   },
   interval = 1,
   naughty_timeout = 15
}
ilog:start()

if debug then
    timer.widgets = socket.gettime() -- debug
    timer.widgetsdiff = timer.widgets-timer.menu
end

-- Create a wibox for each screen and add it (i only use 1 screen)
local my_top_wibox = {}
local my_bottom_wibox ={}
local mypromptbox = {}
local mylayoutbox = {}
local mytaglist = {}

mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ usr.modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ usr.modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
local mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=100 })
                                              end
                                          end),
                 -- awful.button({ }, 3, function (c)
				 --							  client.focus = c
                 --                             instance = awful.menu.clients({ width=100 })
                 --                             end
                 --                         end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
   -- Create a promptbox for each screen
   mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright  })
   -- Create an imagebox widget which will contains an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(awful.util.table.join(
                          awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                          awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                          awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                          awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
   -- Create a taglist widget
   mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

   -- Create a tasklist widget
   mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)
                                 
   -- Create the wiboxes
   my_top_wibox[s] = awful.wibox({ position = 'top', height = usr.top_wibox, screen = s })
   -- Add widgets to the wibox - order matters
   my_top_wibox[s].widgets = {
      {
         mylauncher,
         mytaglist[s],
         mypromptbox[s],
         layout = awful.widget.layout.horizontal.leftright
      },
      mylayoutbox[s],
      s == 1 and mysystray or nil,
      launchbar,
      musicwidget.widget,
      mytasklist[s],
      layout = awful.widget.layout.horizontal.rightleft
   }

   my_bottom_wibox[s] = awful.wibox({ bg = beautiful.bg_bottom, fg = beautiful.fg_bottom, position= 'bottom',screen = s, height = usr.bottom_wibox, border ='0' })
   -- awful.screen.padding(screen[s],{top = 24})
   -- my_bottom_wibox[s].x=0
   -- my_bottom_wibox[s].y=20
   my_bottom_wibox[s].widgets = {
      {
         usr.uptimewidget_enable and uptimewidget or nil,
         usr.cpuwidget_enable and cpuwidget or nil,
         cpugraphwidget,
         cpuinfo > 1 and cpugraphwidget1 or nil,
         cpuinfo > 2 and cpugraphwidget2 or nil,
         cpuinfo > 3 and cpugraphwidget3 or nil,
         usr.memwidget_enable and memwidget or nil,
         usr.memwidget_enable and memgraphwidget or nil,
         usr.netwidget_enable and netwidget or nil,
         layout = awful.widget.layout.horizontal.leftright
     },
         usr.datewidget_enable and datewidget or nil,
         usr.weatherwidget_enable and forecast or nil,
         usr.diskusagewidget_enable and diskwidget or nil,
         usr.aurwidget_enable and aurwidget or nil,
         usr.pacmanwidget_enable and pacmanwidget or nil,
      -- usr.batterywidget_enable and batterywidget or nil,
         layout = awful.widget.layout.horizontal.rightleft
   }
end

if debug then
    timer.wiboxes = socket.gettime() -- debug
    timer.wiboxesdiff = timer.wiboxes-timer.widgets
end

-- Mouse bindings
root.buttons(awful.util.table.join(
   awful.button({ }, 3, function () mymainmenu:toggle() end),
   awful.button({ }, 4, awful.tag.viewnext),
   awful.button({ }, 5, awful.tag.viewprev)
))

-- function custom_keys(t)
--     for _,mod_key_use in pairs(t) do
--         if t == usr.mod_key.up  then
--             tx = 1
--         else
--             tx = -1
--         end
--         awful.key({ usr.modkey,           }, mod_key_use,
--         function ()
--             awful.client.focus.byidx( tx )
--             if client.focus then client.focus:raise() end
--         end)
--     end
-- end

-- Key bindings
local globalkeys = awful.util.table.join(
   awful.key({ usr.modkey,           }, 'Left',   awful.tag.viewprev       ),
   awful.key({ usr.modkey,           }, 'Right',  awful.tag.viewnext       ),
   awful.key({ usr.modkey,           }, 'Escape', awful.tag.history.restore),
   awful.key({ usr.modkey,           },  'e',     req.revelation),  -- revelation
-- custom_keys(usr.mod_key.up),
-- custom_keys(usr.mod_key.down),
   awful.key({ usr.modkey, }, 'j',
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
   awful.key({ usr.modkey, }, 'k',
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
   -- awful.key({ usr.modkey,           }, 'w', function () mymainmenu:show({keygrabber=true}) end),
   -- Layout manipulation
   awful.key({ usr.modkey, 'Shift'   }, 'j', function () awful.client.swap.byidx(  1)    end),
   awful.key({ usr.modkey, 'Shift'   }, 'k', function () awful.client.swap.byidx( -1)    end),
   awful.key({ usr.modkey, 'Control' }, 'j', function () awful.screen.focus_relative( 1) end),
   awful.key({ usr.modkey, 'Control' }, 'k', function () awful.screen.focus_relative(-1) end),
   awful.key({ usr.modkey,           }, 'u', awful.client.urgent.jumpto),
   awful.key({ usr.modkey,           }, 'Tab',
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

   -- Standard program
   awful.key({ usr.modkey,           }, 'Return', function  () usr.exec(usr.terminal) end),
   awful.key({ usr.modkey, 'Control' }, 'r', awesome.restart),
   awful.key({ usr.modkey, 'Shift'   }, 'q', awesome.quit),
   awful.key({ usr.modkey,           }, 'l',     function () awful.tag.incmwfact( 0.05)    end),
   awful.key({ usr.modkey,           }, 'h',     function () awful.tag.incmwfact(-0.05)    end),
   awful.key({ usr.modkey, 'Shift'   }, 'h',     function () awful.tag.incnmaster( 1)      end),
   awful.key({ usr.modkey, 'Shift'   }, 'l',     function () awful.tag.incnmaster(-1)      end),
   awful.key({ usr.modkey, 'Control' }, 'h',     function () awful.tag.incncol( 1)         end),
   awful.key({ usr.modkey, 'Control' }, 'l',     function () awful.tag.incncol(-1)         end),
   awful.key({ usr.modkey,           }, 'space', function () awful.layout.inc(layouts,  1) end),
   awful.key({ usr.modkey, 'Shift'   }, 'space', function () awful.layout.inc(layouts, -1) end),
   awful.key({ usr.modkey, 'Control' }, 'n', awful.client.restore),
   awful.key({ usr.modkey, 'Control' }, 'n', awful.client.restore),

   awful.key({ usr.modkey, }, '`', function () usr.exec('sh '.. home_path .. 'bin/screenshot') end),

   awful.key({ usr.modkey, }, ']', function () usr.exec("sh -c 'luakit -c " .. home_path .. ".config/luakit/rc-proxy.lua  > /dev/null 2>&1'") end),

   awful.key({ usr.modkey, }, '[', function () usr.exec("sh -c 'luakit -U -c " .. home_path .. ".config/luakit/rc.lua  > /dev/null 2>&1'") end),

   awful.key({ usr.modkey, }, '\\', function () usr.exec('spacefm --panel=1') end),

   awful.key({ usr.modkey, 'Control' }, '\\', function () usr.exec('spacefm') end),

   awful.key({ usr.modkey, }, '\'', function () usr.exec('subl') end),

   awful.key({ usr.modkey, }, '/', function () usr.exec('xchat') end),

-- awful.key({ usr.modkey, }, '.', function () usr.exec(home_path .. "Development/luakit/luakit -U luakit://help") end),

   awful.key({ usr.modkey, 'Control' }, 'w', function () usr.exec(usr.primary_browser) end),
   -- yubnub try, 'ls dictionary'
   awful.key({ usr.modkey }, 'w' , function ()
        awful.prompt.run({ prompt = 'Web search: ' }, mypromptbox[mouse.screen].widget,
            function (command)
                usr.exec(usr.primary_browser .. 
                    " 'http://yubnub.org/parser/parse?command=" .. command .. "'", false)
                -- Switch to the web tag, where Firefox is, in this case tag 3
                if tags[mouse.screen][1] then awful.tag.viewonly(tags[mouse.screen][1]) end
            end)
    end),
   awful.key({ usr.modkey }, 'p', function () 
        usr.exec('dmenu_run -i -nb "' .. beautiful.bg_normal.. '" -sb "' .. beautiful.bg_focus ..'" -sf "' .. 
            beautiful.fg_focus ..'" -nf "' .. beautiful.fg_focus .. '" -p "Execute:"') end),
   -- http://awesome.naquadah.org/wiki/Move_Mouse
   awful.key({ usr.modkey , 'Control' }, 'm', function() moveMouse(usr.safeCoords.x, usr.safeCoords.y) end),
   awful.key({ usr.modkey }, 't', -- toggle bottom panel
              function ()
                  my_top_wibox[mouse.screen].visible = not my_top_wibox[mouse.screen].visible
              end),
   awful.key({ usr.modkey }, 'b', -- toggle bottom panel
              function ()
                  my_bottom_wibox[mouse.screen].visible = not my_bottom_wibox[mouse.screen].visible
              end),
   -- req.scratch.drop(prog, vert, horiz, width, height, sticky, screen)
   -- awful.key({ usr.modkey }, 'F11', function () req.scratch.drop('gmrun') end),
awful.key({ usr.modkey }, 'F12', function () req.scratch.drop(usr.terminal, 'bottom', 'left', 0.50, 0.50) end),
      -- http://awesome.naquadah.org/wiki/SSH:_prompt
   awful.key({ usr.modkey, }, 'F3', function ()
     awful.prompt.run({ prompt = 'ssh: ' },
     mypromptbox[mouse.screen].widget,
     function(h)
             usr.exec(usr.terminal .. ' -e ssh ' .. h)
     end,
     function(cmd, cur_pos, ncomp)
             -- get the hosts
             local hosts = {}
             f = io.popen('cut -d " " -f1 ' .. home_path ..  '.ssh/known_hosts | cut -d, -f1')
             for host in f:lines() do
                     table.insert(hosts, host)
             end
             f:close()
             -- abort completion under certain circumstances
             if #cmd == 0 or (cur_pos ~= #cmd + 1 and cmd:sub(cur_pos, cur_pos) ~= ' ') then
                     return cmd, cur_pos
             end
             -- match
             local matches = {}
             table.foreach(hosts, function(x)
                     if hosts[x]:find("^" .. cmd:sub(1,cur_pos)) then
                             table.insert(matches, hosts[x])
                     end
             end)
             -- if there are no matches
             if #matches == 0 then
                     return
             end
             -- cycle
             while ncomp > #matches do
                     ncomp = ncomp - #matches
             end
             -- return match and position
             return matches[ncomp], cur_pos
     end,
     awful.util.getdir('cache') .. '/ssh_history')
end)
)
-- mpd
musicwidget:append_global_keys()
   root.keys(globalkeys)

local clientkeys = awful.util.table.join(
   awful.key({ usr.modkey,           }, 'f',      function (c) c.fullscreen = not c.fullscreen  end),
   awful.key({ usr.modkey, 'Shift'   }, 'c',      function (c) c:kill()                         end),
   awful.key({ usr.modkey,           }, 'c',      function (c) c:kill()                         end),
   awful.key({ usr.modkey, 'Control' }, 'space',  awful.client.floating.toggle                     ),
   awful.key({ usr.modkey, 'Control' }, 'Return', function (c) c:swap(awful.client.getmaster()) end),
   awful.key({ usr.modkey,           }, 'o',      awful.client.movetoscreen                        ),
   awful.key({ usr.modkey, 'Shift'   }, 'r',      function (c) c:redraw()                       end),
   awful.key({ usr.modkey, 'Shift'   }, 't',      function (c) c.ontop = not c.ontop            end),
   awful.key({ usr.modkey,           }, 'n',
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
   awful.key({ usr.modkey,           }, 'm',
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
   -- stick/unstick application to all tags
   awful.key({ usr.modkey }, 's', function (c) c.sticky = not c.sticky end),
   -- toggle title bar for application
   awful.key({ usr.modkey, "Control" }, "t", function (c)
        if   c.titlebar then awful.titlebar.remove(c)
        else awful.titlebar.add(c, { modkey = usr.modkey }) end
    end),
    -- toggle tag title bar
    awful.key({ usr.modkey, "Control" }, "f", function (c) if awful.client.floating.get(c)
        then awful.client.floating.delete(c);    awful.titlebar.remove(c)
        else awful.client.floating.set(c, true); awful.titlebar.add(c) end
    end)
   )

-- Compute the maximum number of digit we need, limited to 9
local keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
   globalkeys = awful.util.table.join(globalkeys,
      awful.key({ usr.modkey }, '#' .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
      awful.key({ usr.modkey, 'Control' }, '#' .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
      awful.key({ usr.modkey, 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
      awful.key({ usr.modkey, 'Control', 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

local clientbuttons = awful.util.table.join(
   awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
   awful.button({ usr.modkey }, 1, awful.mouse.client.move),
   awful.button({ usr.modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- Rules
awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
     properties = { border_width = beautiful.border_width,
                    border_color = beautiful.border_normal,
                    focus = true,
                    keys = clientkeys,
                    size_hints_honor = false,
                    buttons = clientbuttons } },
   { rule = {class = 'URxvt'}, 
     properties = { opacity = 0.6 } },
   { rule = { class = 'Firefox' },          -- browser tag
     properties = { tag = tags[1][1] } },
   { rule = { class = 'Chromium' },         -- browser tag
     properties = { tag = tags[1][1] } },
   { rule = { class = 'luakit' },          -- browser tag
     properties = { tag = tags[1][1] } },
   { rule = {name = 'Xchat'},                -- messages tag
     properties = {tag = tags[1][7]} },
--   callback = function(c) c:tags({tags[1][5], tags[1][4]}) end}, -- multitag
   { rule = {class = 'Sublime'},
     properties = {tag = tags[1][6]} },
   { rule = {class = 'Kdenlive'},
     properties = {tag = tags[1][5]} },
   { rule = { class = 'Plugin-container' }, -- fullscreen youtube videos
     properties = { floating = true } },
 --  { rule = { class = 'Nitrogen' }, 
 --   properties = { tag = tags[1][7], 
 --                   floating = true, 
 --                   border_width = "0", 
 --                   border_height = "0", 
 --                   switchtotag = tags[1][7] }, 
 --                   callback = function(c) c:geometry({x=0, y=0}) end },
}

-- Signal function to execute when a new client appears.
client.add_signal('manage', function (c, startup)
-- Add titlebar to floaters, but remove those from rule callback
-- if awful.client.floating.get(c)
-- or awful.layout.get(c.screen) == awful.layout.suit.floating then
--     if   c.titlebar then awful.titlebar.remove(c)
--     else awful.titlebar.add(c, {modkey = usr.modkey}) end
-- end
   -- Enable sloppy focus
   c:add_signal('mouse::enter', function(c)
      if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
         and awful.client.focus.filter(c) then
         client.focus = c
      end
   end)

   if not startup then
      -- Set the windows at the slave,
      -- i.e. put it at the end of others instead of setting it master.
      awful.client.setslave(c)
      -- Put windows in a smart way, only if they does not set an initial position.
      if not c.size_hints.user_position and not c.size_hints.program_position then
         awful.placement.no_overlap(c)
         awful.placement.no_offscreen(c)
      end
   end
end)

client.add_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.add_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)

-- Round number off to decimals function
function round(number, decimal)
	local multiplier = 10^(decimal or 0)
	return math.floor(number * multiplier + 0.5) / multiplier
end

-- Run once functions
local function processwalker()
   local function yieldprocess()
      for dir in req.lfs.dir('/proc') do
         -- All directories in /proc containing a number, represent a process
         if tonumber(dir) ~= nil then
            local f, err = io.open('/proc/'..dir..'/cmdline')
            if f then
               local cmdline = f:read('*all')
               f:close()
               if cmdline ~= '' then
                  coroutine.yield(cmdline)
               end
             end
           end
         end
      end
   return coroutine.wrap(yieldprocess)
end

local function run_once(process, cmd)
   assert(type(process) == 'string')
   local regex_killer = {
      ["+"]  = "%+", ["-"] = "%-",
      ["*"]  = "%*", ["?"]  = "%?" }
   for p in processwalker() do
      if p:find(process:gsub("[-+?*]", regex_killer)) then
         return
      end
   end
   return usr.exec(cmd or process)
end
-- dmenu parcellite cairo-compmgr mpd mpc scrot rxvt-unicode-patched
-- Autostart programs here or in ~/.xinitrc (Autostart Daemons in /etc/rc.conf)
-- launch clipboard manager
run_once('parcellite')
-- launch the composite manager
run_once('cairo-compmgr')
-- Use the second argument, if the programm you wanna start differs from the what you want to search.
-- run_once('redshift', 'redshift -o -l 0:0 -t 6500:5500')

-- grab window/client class
if usr.debug_clients then
    t = timer { timeout = 3 }
    t:add_signal('timeout',
            function () for i,c in ipairs(client.get(mouse.screen)) do
                            if c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
                                    naughty.notify({title = c.class, text = c.role})
                                    naughty.notify({title = c.class, text = c.instance})
                                    end
                        end
            end)
    t:start()
end

if debug then
    timer.awfulkeys = socket.gettime() -- debug
    timer.awfulkeysdiff = timer.awfulkeys-timer.wiboxes
    -- Script execution time and information
    local function timer_output()
        return "\n::: Session started: ".. os.date() .. " :::\r\n\n" .. 
                "Awesomewm-X: ".. req.awmXversion .."\n" ..
                "Script: " .. beautiful.wpscript .. "\n" ..
                "Theme: ".. beautiful.theme_name .."\n" .. 
                "User: " .. os.getenv('USER') .."@" .. awful.util.pread('hostname'):match("[^\n]*") .. "\n" ..
                "Libraries: Loaded in " .. round(timer.libsdiff, 4) .. "\n" ..
                "User: Loaded in " .. round(timer.usrdiff, 4) .. "\n" ..
                "Menus: Loaded in " .. round(timer.menudiff, 4) .. "\n" ..
                "Widgets: Loaded in " .. round(timer.widgetsdiff, 4) .. "\n" ..
                "Wiboxes: Loaded in " .. round(timer.wiboxesdiff, 4) .. "\n" ..
                "Awfulkeys: Loaded in " .. round(timer.awfulkeysdiff, 4) .. "\n" ..
                "Execution time: " .. round(socket.gettime() - timer.start, 3) .. " seconds\n"
    end
    timer.output = timer_output()
    -- Welcome message
    naughty.notify {
        title = 'Awesome '.. awesome.version,
        text = timer.output,
        ontop = true,
        timeout = 20
    }
    io.stderr:write( timer.output) -- debug
    io.stderr:flush()
    io.stderr:close()
end
-- }}} EndFile