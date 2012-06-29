-- https://github.com/idk/awesomewm-X
-- Standard awesome library
require('awful')
require('awful.autofocus')
require('awful.rules')
-- Theme handling library
require('beautiful')
-- Notification library
require('naughty')
-- Widget library
-- require('wicked')
-- Custom widgets
-- require('weather')           -- http://github.com/jesseadams/weather
require('vicious')           -- http://awesome.naquadah.org/wiki/Vicious
require('freedesktop.utils') -- 
require('freedesktop.menu')  -- https://github.com/terceiro/awesome-freedesktop
-- require('cal')               -- https://github.com/Mic92/awesome-dotfiles
require('revelation')        -- http://awesome.naquadah.org/wiki/Revelation
require('awesompd/awesompd') -- awesome.naquadah.org/wiki/Awesompd_widget
require('scratch')           -- http://awesome.naquadah.org/wiki/Scratchpad_manager

-- {{{ Error handling
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
-- }}}

-- {{{ Variable definitions
-- Home sweet home
home_path = '/home/pdq/'
-- Themes define colours, icons, and wallpapers
beautiful.init(home_path .. '.config/awesome/themes/default/theme.lua')

bottom_panel_color = '#222222' -- bottom panel color
bottom_panel_text_color = '#D7D0C7' -- bottom panel text color

-- This is used later as the default terminal and editor to run.
terminal = 'urxvtc' -- requires urxvt daemon: 'urxvtd -q -o -f'
terminal_cmd = terminal .. ' -e '

editor = os.getenv('EDITOR') or 'geany'
editor_cmd = terminal_cmd .. editor

su_editor_cmd = terminal_cmd .. 'sudo ' .. editor
sudo_bash = terminal_cmd .. 'sudo bash '

-- weather_zipcode = '90210' -- USA/Canada postal code

-- Specify your folder with shortcuts here
launcher_path = home_path .. '.config/awesome/launcher/'

freedesktop.utils.terminal = terminal  -- default: 'urxvtc'
freedesktop.utils.icon_theme = 'AwOken' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

-- http://awesome.naquadah.org/wiki/Move_Mouse
-- set the desired pixel coordinates:

--  if your screen is 1440x900 the this line sets the bottom right.
-- local safeCoords = {x=1440, y=900}
-- if your screen is 1440x900 the this line sets the bottom left.
local safeCoords = {x=0, y=900}
--  this line sets top middle(ish).
-- local safeCoords = {x=720, y=0}
-- Flag to tell Awesome whether to do this at startup.
local moveMouseOnStartup = true

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = 'Mod4'

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
   awful.layout.suit.floating,        -- 1
   awful.layout.suit.tile,            -- 2
   awful.layout.suit.tile.left,       -- 3
   awful.layout.suit.tile.bottom,     -- 4
   awful.layout.suit.tile.top,        -- 5
   awful.layout.suit.fair,            -- 6
   awful.layout.suit.fair.horizontal, -- 7
   awful.layout.suit.spiral,          -- 8
   awful.layout.suit.spiral.dwindle,  -- 9
   awful.layout.suit.max,             -- 10
   awful.layout.suit.max.fullscreen,  -- 11
   awful.layout.suit.magnifier        -- 12
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
-- tags = {}
-- for s = 1, screen.count() do
    -- Each screen has its own tag table.
--     tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
-- end

tags = {
   names  = { 
      '1:Transporters', 
      '2:TheConn', 
      '3:Astrometrics', 
      '4:Holodeck1',  
      '5:Holodeck2', 
      '6:Engineering', 
      '7:TheBridge',
      '8:WarpCore'
   --   '9:Test'
            },
   layout = {
      layouts[10], -- 1:firefox
      layouts[6],  -- 2:weechat
      layouts[3],  -- 3:tmux->htop/ncmpcpp/shells
      layouts[6],  -- 4:media playing
      layouts[6],  -- 5:multitail local/remote
      layouts[1],  -- 6:IDE/editor/projects
      layouts[6],  -- 7:shells
      layouts[1]   -- 8:shells
   --   layouts[6]   -- 9:test
            }
        }

for s = 1, screen.count() do
   -- Each screen has its own tag table.
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
menu_items = freedesktop.menu.new()
myawesomemenu = {
   { 'Appearance', 'lxappearance', freedesktop.utils.lookup_icon({ icon = 'style' }) },
   { 'Wallpaper', 'nitrogen', freedesktop.utils.lookup_icon({ icon = 'style' }) },
-- { 'Edit config', editor_cmd .. ' ' .. awesome.conffile, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) },
   { 'Preferred Apps' , 'exo-preferred-applications', freedesktop.utils.lookup_icon({ icon = 'help' })},
   { 'Reload', awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Logout', awesome.quit, freedesktop.utils.lookup_icon({ icon = 'system-log-out' })},
   { 'Shutdown' , 'sudo /sbin/halt -p', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })},
   { 'Reboot' , 'sudo /sbin/reboot', freedesktop.utils.lookup_icon({ icon = 'system-shutdown' })}
}

servicesmenu = {
  { 'Transmission On', terminal_cmd .. 'transmission-daemon -g ' .. home_path .. '.config/transmission', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Transmission Off', terminal_cmd .. 'killall transmission-daemon', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'Mount HDD2', sudo_bash .. 'udisks --mount /dev/sdb4', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP On', sudo_bash .. 'lamp start', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'LAMP Off', sudo_bash .. 'lamp stop', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'MPD On', sudo_bash .. 'rc.d start mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   { 'MPD Off', sudo_bash .. 'rc.d stop mpd', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   -- { 'rtorrent On', terminal_cmd .. 'tmux new-window rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
   -- { 'rtorrent Off', terminal_cmd .. 'killall rtorrent', freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) }
}

-- table.insert(menu_items, { 'awesome', myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { 'Interface', myawesomemenu,  freedesktop.utils.lookup_icon({icon = 'help'}) })
table.insert(menu_items, { 'Services', servicesmenu, freedesktop.utils.lookup_icon({ icon = 'package_settings' }) })
table.insert(menu_items, { 'Terminal', terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })
-- table.insert(menu_items, { 'Thunar', 'Thunar', freedesktop.utils.lookup_icon({icon = 'file-manager'}) })
-- table.insert(menu_items, { 'SpaceFM', 'spacefm', freedesktop.utils.lookup_icon({icon = 'file-manager'}) })
table.insert(menu_items, { 'Dolphin', 'dolphin', freedesktop.utils.lookup_icon({icon = 'file-manager'}) })
table.insert(menu_items, { 'Task Manager', 'lxtask', freedesktop.utils.lookup_icon({icon = 'utilities-system-monitor'}) })

mymainmenu = awful.menu.new({ items = menu_items, width = 150 })

mylauncher = awful.widget.launcher({ image = image(beautiful.arch_icon),
                                     menu = mymainmenu })
                                     
mscpacmanwidget = awful.widget.launcher({ image = image(beautiful.mspacman_icon),  menu = mymainmenu })
                                     
pacmanwidget = awful.widget.launcher({ image = image(beautiful.pacman_icon),  menu = mymainmenu })
-- }}}

-- {{{ Wiboxes
-- Create a textclock widget
  datewidget = widget({
    type = 'textbox',
    name = 'datewidget'
 })

 datewidget.bg = bottom_panel_color
-- datewidget.width = 325
-- datewidget.width, datewidget.align = 140, 'right'

 vicious.register(datewidget, vicious.widgets.date,
    '     <span color="' .. bottom_panel_text_color .. '">%b %d, %R</span>   ')

-- Calendar widget to attach to the textclock
require('calendar2')
calendar2.addCalendarToWidget(datewidget)


-- Create a systray
mysystray = widget({ type = 'systray' })
mysystray.bg = bottom_panel_color

-- {{{ Separator Widget
separator = widget({ type = "textbox" })
separator.bg = bottom_panel_color
separator.text  = ' '
-- }}}

-- Disk useage widget
-- http://jasonmaur.com/awesome-wm-widgets-configuration/#disk-usage
diskwidget = widget({ type = 'textbox' })
diskwidget.width = 100
diskwidget.text = 'Diskusage'
disk = require('diskusage')
-- the first argument is the widget to trigger the diskusage
-- the second/third is the percentage at which a line gets orange/red
-- true = show only local filesystems
disk.addToWidget(diskwidget, 75, 90, true)

-- Weather widget
-- forecast = widget({ type = 'textbox', name = 'weather' })
-- forecast.bg = bottom_panel_color
-- forecast.width = 110
-- weather.register(forecast, weather_zipcode)

-- Weather widget
forecast = widget({ type = "textbox", name = "weather" })
forecast.bg = bottom_panel_color
weather_t = awful.tooltip({ objects = { forecast },})

vicious.register(forecast, vicious.widgets.weather, function (widget, args) weather_t:set_text("City: " .. args["{city}"] .. "\nTemperature: " .. args["{tempc}"] .. " °C\t" .. args["{tempf}"] .. " °F " .. "\nWind Condition: " .. args["{wind}"] .. "\nWind Speed: " .. args["{windkmh}"] .. " km/h\t" .. args["{windmph}"] .. " mph\t" .. "\nSky: " .. args["{sky}"] .. "\nHumidity: " .. args["{humid}"] .. "%\n" .. "Pressure: " .. args["{press}"] .. " hPa") return '<span color="' .. bottom_panel_text_color ..'">' .. args["{weather}"] .. '</span>' end, 1800, "KEWB")
--'1800': check every 30 minutes.
--'KEWB': the DMass ICAO code.


-- awesome.naquadah.org/wiki/Awesompd_widget
musicwidget = awesompd:create() -- Create awesompd widget
musicwidget.font = 'Envy Code R' -- Set widget font 
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
-- Specify how big in pixels should an album cover be. Maximum value
-- is 100.
musicwidget.album_cover_size = 50
-- This option is necessary if you want the album covers to be shown
-- for your local tracks.
musicwidget.mpd_config = home_path .. '.mpdconf'
-- Specify the browser you use so awesompd can open links from
-- Jamendo in it.
musicwidget.browser = 'firefox'
-- Specify decorators on the left and the right side of the
-- widget. Or just leave empty strings if you decorate the widget
-- from outside.
musicwidget.ldecorator = ' ♫ '
musicwidget.rdecorator = ' ♫ '
-- Set all the servers to work with (here can be any servers you use)
musicwidget.servers = {
  { server = 'localhost',
       port = 6600 } }
--  { server = '192.168.0.72',
--       port = 6600 } }
-- Set the buttons of the widget
musicwidget:register_buttons({ { '', awesompd.MOUSE_LEFT, musicwidget:command_toggle() },
                            { 'Control', awesompd.MOUSE_SCROLL_UP, musicwidget:command_prev_track() },
                            { 'Control', awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_next_track() },
                            { '', awesompd.MOUSE_SCROLL_UP, musicwidget:command_volume_up() },
                            { '', awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_volume_down() },
                            { '', awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
                            { '', 'XF86AudioLowerVolume', musicwidget:command_volume_down() },
                            { '', 'XF86AudioRaiseVolume', musicwidget:command_volume_up() },
                            { modkey, 'Pause', musicwidget:command_playpause() } })
musicwidget:run() -- After all configuration is done, run the widget
-- End mpd

-- Quick launch bar widget BEGINS
function getValue(t, key)
   _, _, res = string.find(t, key .. " *= *([^%c]+)%c")
   return res
end

function split (s,t)
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

launchbar = { layout = awful.widget.layout.horizontal.rightleft }
filedir = launcher_path
files = split(io.popen('ls ' .. filedir .. '*.desktop'):read('*all'),"\n")
for i = 1, table.getn(files) do
   local t = io.open(files[i]):read('*all')
   launchbar[i] = { image = image(getValue(t,'Icon')),
                    command = getValue(t,'Exec'),
 --                   tooltip = getValue(t,'Name'),
                    position = tonumber(getValue(t,'Position')) or 255 }
end
-- 
table.sort(launchbar, function(a,b) return a.position < b.position end)
for i = 1, table.getn(launchbar) do
   local txt = launchbar[i].tooltip
   launchbar[i] = awful.widget.launcher(launchbar[i])
--   local tt = awful.tooltip ({ objects = { launchbar[i] } })
--   tt:set_text (txt)
--   tt:set_timeout (0)
end
-- Quick launch bar widget ENDS

-- load avg
cpuwidget = widget({
    type = 'textbox',
    name = 'cpuwidget'
})

cpuwidget.width = 105
cpuwidget.bg = bottom_panel_color

vicious.register(cpuwidget, vicious.widgets.cpu, '   <span color="' .. bottom_panel_text_color .. '">Cores: $1%</span>')
-- graphics cpu widget
cpugraphwidget = awful.widget.graph()
cpugraphwidget:set_width(40)
cpugraphwidget:set_background_color(bottom_panel_color)
cpugraphwidget:set_color(beautiful.fg_normal)
cpugraphwidget:set_gradient_colors({ 'blue', 'blue', 'blue' })
-- Register widget
vicious.register(cpugraphwidget, vicious.widgets.cpu, "$1")

cpugraphwidget1 = awful.widget.graph()
cpugraphwidget1:set_width(40)
cpugraphwidget1:set_background_color(bottom_panel_color)
cpugraphwidget1:set_color(beautiful.fg_normal)
cpugraphwidget1:set_gradient_colors({ 'pink', 'pink', 'pink' })
-- Register widget
vicious.register(cpugraphwidget1, vicious.widgets.cpu, "$2")

cpugraphwidget2 = awful.widget.graph()
cpugraphwidget2:set_width(40)
cpugraphwidget2:set_background_color(bottom_panel_color)
cpugraphwidget2:set_color(beautiful.fg_normal)
cpugraphwidget2:set_gradient_colors({ 'orange', 'orange', 'orange' })
-- Register widget
vicious.register(cpugraphwidget2, vicious.widgets.cpu, "$3")

cpugraphwidget3 = awful.widget.graph()
cpugraphwidget3:set_width(40)
cpugraphwidget3:set_background_color(bottom_panel_color)
cpugraphwidget3:set_color(beautiful.fg_normal)
cpugraphwidget3:set_gradient_colors({ 'red', 'red', 'red' })
-- Register widget
vicious.register(cpugraphwidget3, vicious.widgets.cpu, "$4")


netwidget = widget({
    type = 'textbox',
    name = 'netwidget',
    align = 'left'
})

netwidget.bg = bottom_panel_color
netwidget.width = 400
vicious.register(netwidget, vicious.widgets.net, 
   -- '    Traffic: ↓ ${eth0 down_kb}kb/s ↑ ${eth0 up_kb}kb/s', 3)
        '    Traffic: ↓ ${eth0 down_kb}kb/s ↑ ${eth0 up_kb}kb/s  Total: ↓ ${eth0 rx_gb}GiB ↑ ${eth0 tx_gb}GiB', 3)


-- vicious.widgets.uptime
  -- provides system uptime and load information
  -- returns 1st value as uptime in days, 2nd as uptime in hours, 3rd
  --  as uptime in minutes, 4th as load average for past 1 minute, 5th
  --  for 5 minutes and 6th for 15 minutes
  
uptimewidget = widget({ type = "textbox" })
uptimewidget.bg = bottom_panel_color
vicious.register(uptimewidget, vicious.widgets.uptime, '<span color="' .. bottom_panel_text_color .. '">Uptime: $1d $2:$3, $4, $5, $6</span>', 60)



memwidget = widget({
    type = 'textbox',
    name = 'memwidget'
})
memwidget.bg = bottom_panel_color
vicious.register(memwidget, vicious.widgets.mem,
    '  Memory: $1% $2MB/$3MB ')

-- memory widget
memgraphwidget = awful.widget.graph()
memgraphwidget:set_width(60)
memgraphwidget:set_background_color(bottom_panel_color)
memgraphwidget:set_color(beautiful.fg_normal)
memgraphwidget:set_gradient_colors({ '#218821', '#218821', '#218821' }) 
-- Register widget
vicious.register(memgraphwidget, vicious.widgets.mem, '$1', 5)

-- Simple function to move the mouse to the coordinates set above.
local function moveMouse(x_co, y_co)
    mouse.coords({ x=x_co, y=y_co })
end
-- Optionally move the mouse when rc.lua is read (startup)
if moveMouseOnStartup then
        moveMouse(safeCoords.x, safeCoords.y)
end

-- Create a wibox for each screen and add it (i only use 1 screen)
my_top_wibox = {}
my_bottom_wibox ={}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}

--widget separators
-- separator = widget({ type = 'textbox', name = 'separator'})
-- separator.text = ' '
-- separator = widget({ type = 'textbox',  name = 'separator', align = 'left'})
-- separator.text = ' '

-- top panel items
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
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
   mypromptbox[s] = awful.widget.prompt(
      { layout = awful.widget.layout.horizontal.leftright  })
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
   my_top_wibox[s] = awful.wibox({ position = 'top', height = '18', screen = s })
   -- Add widgets to the wibox - order matters
   my_top_wibox[s].widgets = {
      {
         mylauncher,
         mytaglist[s],
         mypromptbox[s],
         layout = awful.widget.layout.horizontal.leftright
      },
      mylayoutbox[s],
      -- netwidget,
      separator,
      launchbar,
            musicwidget.widget,
      mytasklist[s],
      layout = awful.widget.layout.horizontal.rightleft
   }

   my_bottom_wibox[s] = awful.wibox({ position= 'bottom',screen = s, height = '18', border ='0' })
   -- awful.screen.padding(screen[s],{top = 24})
   -- my_bottom_wibox[s].x=0
   -- my_bottom_wibox[s].y=20
   my_bottom_wibox[s].widgets = {
      {
       separator,
         uptimewidget,
         loadwidget,
         cpuwidget,
         cpugraphwidget,
         cpugraphwidget1,
         cpugraphwidget2,
         cpugraphwidget3,
         separator,
         memwidget,
         memgraphwidget,
         separator,
         netwidget,
      --   forecast,
         datewidget,
         layout = awful.widget.layout.horizontal.leftright
     },
         --   forecast,
         s == 1 and mysystray or nil,
      separator,
      diskwidget,
         layout = awful.widget.layout.horizontal.rightleft
   }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
   awful.button({ }, 3, function () mymainmenu:toggle() end),
   awful.button({ }, 4, awful.tag.viewnext),
   awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
   awful.key({ modkey,           }, 'Left',   awful.tag.viewprev       ),
   awful.key({ modkey,           }, 'Right',  awful.tag.viewnext       ),
   awful.key({ modkey,           }, 'Escape', awful.tag.history.restore),
   awful.key({ modkey,           },  'e', revelation),  -- revelation
   awful.key({ modkey,           }, 'j',
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
   awful.key({ modkey,           }, 'k',
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
   awful.key({ modkey,           }, 'w', function () mymainmenu:show({keygrabber=true}) end),

   -- Layout manipulation
   awful.key({ modkey, 'Shift'   }, 'j', function () awful.client.swap.byidx(  1)    end),
   awful.key({ modkey, 'Shift'   }, 'k', function () awful.client.swap.byidx( -1)    end),
   awful.key({ modkey, 'Control' }, 'j', function () awful.screen.focus_relative( 1) end),
   awful.key({ modkey, 'Control' }, 'k', function () awful.screen.focus_relative(-1) end),
   awful.key({ modkey,           }, 'u', awful.client.urgent.jumpto),
   awful.key({ modkey,           }, 'Tab',
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

   -- Standard program
   awful.key({ modkey,           }, 'Return', function () awful.util.spawn(terminal) end),
   awful.key({ modkey, 'Control' }, 'r', awesome.restart),
   awful.key({ modkey, 'Shift'   }, 'q', awesome.quit),
   awful.key({ modkey,           }, 'l',     function () awful.tag.incmwfact( 0.05)    end),
   awful.key({ modkey,           }, 'h',     function () awful.tag.incmwfact(-0.05)    end),
   awful.key({ modkey, 'Shift'   }, 'h',     function () awful.tag.incnmaster( 1)      end),
   awful.key({ modkey, 'Shift'   }, 'l',     function () awful.tag.incnmaster(-1)      end),
   awful.key({ modkey, 'Control' }, 'h',     function () awful.tag.incncol( 1)         end),
   awful.key({ modkey, 'Control' }, 'l',     function () awful.tag.incncol(-1)         end),
   awful.key({ modkey,           }, 'space', function () awful.layout.inc(layouts,  1) end),
   awful.key({ modkey, 'Shift'   }, 'space', function () awful.layout.inc(layouts, -1) end),
   awful.key({ modkey, 'Control' }, 'n', awful.client.restore),

   -- Prompt
   awful.key({ modkey },            'r',     function () mypromptbox[mouse.screen]:run() end),

   awful.key({ modkey }, 'x',
              function ()
                  awful.prompt.run({ prompt = 'Run Lua code: ' },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir('cache') .. '/history_eval')
              end),
              
   -- Custom new
   -- http://awesome.naquadah.org/wiki/Move_Mouse
   awful.key({ modkey , 'Control' }, 'm', function() moveMouse(safeCoords.x, safeCoords.y) end),
   
   -- toggle top panel
   awful.key({ modkey }, 't', 
              function ()
                  my_top_wibox[mouse.screen].visible = not my_top_wibox[mouse.screen].visible
              end),
              
   -- toggle bottom panel
   awful.key({ modkey }, 'b', 
              function ()
                  my_bottom_wibox[mouse.screen].visible = not my_bottom_wibox[mouse.screen].visible
              end),
              
   -- scratch
   -- scratch.drop(prog, vert, horiz, width, height, sticky, screen)
   -- awful.key({ modkey }, 'F11', function () scratch.drop('gmrun') end),
   awful.key({ modkey }, 'F12', function () scratch.drop(terminal, 'bottom', 'left', 0.50, 0.50) end),
   
   -- http://awesome.naquadah.org/wiki/SSH:_prompt
   awful.key({ modkey, }, "F2", function ()
     awful.prompt.run({ prompt = "ssh: " },
     mypromptbox[mouse.screen].widget,
     function(h)
             awful.util.spawn(terminal .. " -e ssh " .. h)
     end,
     function(cmd, cur_pos, ncomp)
             -- get the hosts
             local hosts = {}
             f = io.popen('cut -d " " -f1 ' .. os.getenv("HOME") ..  '/.ssh/known_hosts | cut -d, -f1')
             for host in f:lines() do
                     table.insert(hosts, host)
             end
             f:close()
             -- abort completion under certain circumstances
             if #cmd == 0 or (cur_pos ~= #cmd + 1 and cmd:sub(cur_pos, cur_pos) ~= " ") then
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
     awful.util.getdir("cache") .. "/ssh_history")
end)

)

-- mpd
musicwidget:append_global_keys()
   root.keys(globalkeys)

clientkeys = awful.util.table.join(
   awful.key({ modkey,           }, 'f',      function (c) c.fullscreen = not c.fullscreen  end),
   awful.key({ modkey, 'Shift'   }, 'c',      function (c) c:kill()                         end),
   awful.key({ modkey,           }, 'c',      function (c) c:kill()                         end),
   awful.key({ modkey, 'Control' }, 'space',  awful.client.floating.toggle                     ),
   awful.key({ modkey, 'Control' }, 'Return', function (c) c:swap(awful.client.getmaster()) end),
   awful.key({ modkey,           }, 'o',      awful.client.movetoscreen                        ),
   awful.key({ modkey, 'Shift'   }, 'r',      function (c) c:redraw()                       end),
   awful.key({ modkey, 'Shift'   }, 't',      function (c) c.ontop = not c.ontop            end),
   awful.key({ modkey,           }, 'n',
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
   awful.key({ modkey,           }, 'm',
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
   globalkeys = awful.util.table.join(globalkeys,
      awful.key({ modkey }, '#' .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
      awful.key({ modkey, 'Control' }, '#' .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
      awful.key({ modkey, 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
      awful.key({ modkey, 'Control', 'Shift' }, '#' .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
   awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
   awful.button({ modkey }, 1, awful.mouse.client.move),
   awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
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
     properties = { opacity = 0.8 } },
   { rule = { class = 'Firefox' },          -- browser tag
     properties = { tag = tags[1][1] } },
   { rule = { class = 'Chromium' },         -- browser tag
     properties = { tag = tags[1][1] } },
   { rule = { class = 'Gnome-connection-manager' },
     properties = { opacity = 0.8 } },
   { rule = {name = 'Xchat'},                -- messages tag
     properties = {tag = tags[1][2]} },     
--   { rule = {name = 'finch'},               -- messages tag
--     properties = {tag = tags[1][2]} },
   { rule = {name = 'irssi'},               -- messages tag
     properties = {tag = tags[1][2]} },
   { rule = {name = 'ncmpc++ ver. 0.5.8'},  -- messages tag
     properties = {tag = tags[1][3]} },
--   { rule = {name = 'cmatrix'},             -- messages tag
--     properties = {tag = tags[1][3]} },
--   { rule = {name = 'Tyrs'},                -- messages tag
--     properties = {tag = tags[1][3]} },
-- { rule = {class = 'Totem'},              -- nowplaying tag
--   properties = {tag = tags[1][4]} },
   { rule = {class = 'Mplayer'},           -- nowplaying tag
     properties = {tag = tags[1][7]} },
-- { rule = {class = 'Umplayer'},           -- nowplaying tag
--   properties = {tag = tags[1][7]} },
   { rule = { class = 'Transmission' },     -- torrents tag
     properties = {tag = tags[1][5] } },
--   callback = function(c) c:tags({tags[1][5], tags[1][4]}) end}, -- multitag
   { rule = {class = 'Geany'},              -- develop tag
     properties = {tag = tags[1][6]} },
-- { rule = { class = 'gimp' },             -- floating windows
--   properties = { floating = true } },   
   { rule = {class = 'Openshot'},           -- editvideo tag
     properties = {tag = tags[1][7]} },
   { rule = {class = 'Kdenlive'},           -- editvideo tag
     properties = {tag = tags[1][7]} },
   { rule = {class = 'Nitrogen'},           -- appearance tag
     properties = {tag = tags[1][8]} },
   { rule = {class = 'Lxappearance'},       -- appearance tag
     properties = {tag = tags[1][8] } },
 --  { rule = {class = 'Glista'},             -- appearance tag
 --    properties = {tag = tags[1][8] } },
   { rule = {class = 'Shutter'},            -- desktop tag
     properties = {tag = tags[1][2]}, floating = true,  },
 --  { rule = { class = 'Nitrogen' }, 
 --   properties = { tag = tags[1][7], 
 --                   floating = true, 
 --                   border_width = "0", 
 --                   border_height = "0", 
 --                   switchtotag = tags[1][7] }, 
 --                   callback = function(c) c:geometry({x=0, y=0}) end },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal('manage', function (c, startup)
   -- Add a titlebar
   -- awful.titlebar.add(c, { modkey = modkey })
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
      -- awful.client.setslave(c)
      -- Put windows in a smart way, only if they does not set an initial position.
      if not c.size_hints.user_position and not c.size_hints.program_position then
         awful.placement.no_overlap(c)
         awful.placement.no_offscreen(c)
      end
   end
end)

client.add_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.add_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
-- }}}

require('lfs') 
-- {{{ Run once functions
local function processwalker()
   local function yieldprocess()
      for dir in lfs.dir('/proc') do
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
   return awful.util.spawn(cmd or process)
end
-- }}}

--{{{ Autostart programs here or in ~/.xinitrc (Autostart Daemons in /etc/rc.conf)
-- launch terminal stuffs
-- run_once('irssi', 'urxvt -e irssi')
-- run_once('cmatrix', 'urxvt -e cmatrix -C magenta')
-- launch common applications
-- run_once('dropboxd')
-- run_once('shutter')
-- run_once('pidgin')
-- launch application launcher
run_once('synapse')
-- launch clipboard manager
run_once('parcellite')
-- launch mouse icon fade out
-- run_once('unclutter')
-- launch conkys
run_once('conky', home_path .. '.config/conky/archconky.sh')
-- launch the composite manager
-- run_once('xcompmgr')
-- run_once('cairo-compmgr')
-- run_once('unagi')
-- launch the desktop icons
run_once('idesk')
-- launch the desktop live wallpaper
-- run_once('xplanetFX')
--
-- Use the second argument, if the programm you wanna start, 
-- differs from the what you want to search.
-- run_once('redshift', 'redshift -o -l 0:0 -t 6500:5500')
-- run_once('redshift', 'redshift -o -l 0:0 -b 0.8 -t 6500:4500')
-- }}}
