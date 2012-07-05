-- strict, awesome3 theme, by zhuravlik

--{{{ Main
require('awful.util')

theme = {}

config        = home_path .. '.config/awesome'
shared        = '/usr/share/awesome'
if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
    shared    = '/usr/share/local/awesome'
end
sharedicons   = shared .. '/icons'
sharedthemes  = shared .. '/themes'
themes        = config .. '/themes'
name = 'strict'
themename     = '/' .. name
theme.theme_name = name
if not awful.util.file_readable(themes .. themename .. '/theme.lua') then
       themes = sharedthemes
end
themedir      = themes .. themename

wallpaper1    = themedir .. '/background.jpg'
wallpaper2    = themedir .. '/background_alt.jpg'
wallpaper3    = sharedthemes .. '/zenburn/zenburn-background.png'
wallpaper4    = sharedthemes .. '/default/background.png'
wpscript      = home_path .. '.wallpaper'
wpscript2     = themedir .. '/script.sh'

str1 = ''
str2 = ''
str3 = ''
str4 = ''
str5 = ''
str6 = ''
if script_options.idesk then
    str1 = ' idesk '
end
if script_options.wallpaper then
    str2 = ' wp '
end
if script_options.conky_1 then
    str3 = ' conky '
end
if script_options.conky_2 then
    str4 = ' eng '
end
if script_options.linux then
    str5 = ' ' .. script_options.linux .. ' '
end
if script_options.email then
    str6 = ' email '
end

script_run = string.format("%s%s%s%s%s%s", str1, str2, str3, str4, str5, str6);

if awful.util.file_readable(wpscript2) then
    theme.wallpaper_cmd = { 'sh ' .. wpscript2 .. ' ' .. script_run }
elseif awful.util.file_readable(wallpaper1) then
	theme.wallpaper_cmd = { 'awsetbg ' .. wallpaper1 }
elseif awful.util.file_readable(wallpaper2) then
	theme.wallpaper_cmd = { 'awsetbg ' .. wallpaper2 }
elseif awful.util.file_readable(wpscript) then
	theme.wallpaper_cmd = { 'sh ' .. wpscript }
elseif awful.util.file_readable(wallpaper3) then
	theme.wallpaper_cmd = { 'awsetbg ' .. wallpaper3 }
else
	theme.wallpaper_cmd = { 'awsetbg ' .. wallpaper4 }
end

if awful.util.file_readable(config .. '/vain/init.lua') then
    theme.useless_gap_width  = '3'
end
--}}}
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
theme.font          = 'sans 8'

theme.bg_normal     = '#eeeeecee' --dd
theme.bg_focus      = '#4f5353ee'
theme.bg_urgent     = '#ff0000ee'
theme.bg_minimize   = '#303535ee'

theme.fg_normal     = '#505050'
--theme.fg_focus      = '#b9bbbb'c
theme.fg_focus      = '#cacccc'
theme.fg_urgent     = '#f7f7f7'
theme.fg_minimize  = '#b9bbbb'

theme.bg_bottom     = '#eeeeecee' -- bottom panel color
theme.fg_bottom     = '#505050' -- bottom panel text color
theme.bg_graphs     = '#5A5D5D' -- graphs background color

theme.border_width  = '1'
theme.border_normal = '#cbc8c1'
theme.border_focus  = '#282421'
theme.border_marked = '#f7f7f7'

-- There are another variables sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--taglist_bg_focus = #ff0000

-- Display the taglist squares
theme.taglist_squares_sel = themedir .. '/taglist/squarefw.png'
theme.taglist_squares_unsel = themedir .. '/taglist/square.png'

theme.tasklist_floating_icon = themedir .. '/tasklist/floatingw.png'

-- Variables set for theming menu
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themedir .. '/submenu.png'
theme.menu_height   = '15'
theme.menu_width    = '100'

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--bg_widget    = #cc0000

-- Define the image to load
theme.titlebar_close_button_normal = themedir .. '/titlebar/close_normal.png'
theme.titlebar_close_button_focus = themedir .. '/titlebar/close_focus.png'

theme.titlebar_ontop_button_normal_inactive = themedir .. '/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive = themedir .. '/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = themedir .. '/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active = themedir .. '/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = themedir .. '/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive = themedir .. '/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = themedir .. '/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active = themedir .. '/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = themedir .. '/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive = themedir .. '/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = themedir .. '/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active = themedir .. '/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = themedir .. '/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive = themedir .. '/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = themedir .. '/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active = themedir .. '/titlebar/maximized_focus_active.png'

-- You can use your own layout icons like this:
theme.layout_fairh = themedir .. '/layouts/fairh.png'
theme.layout_fairv = themedir .. '/layouts/fairv.png'
theme.layout_floating = themedir .. '/layouts/floating.png'
theme.layout_magnifier = themedir .. '/layouts/magnifier.png'
theme.layout_max = themedir .. '/layouts/max.png'
theme.layout_fullscreen = themedir .. '/layouts/fullscreen.png'
theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
theme.layout_tileleft = themedir .. '/layouts/tileleft.png'
theme.layout_tile = themedir .. '/layouts/tile.png'
theme.layout_tiletop = themedir .. '/layouts/tiletop.png'

theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
-- theme.awesome_icon = sharedicons .. '/awesome16.png'
-- theme.awesome_icon = themedir .. '/awesome-icon-3.png'

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
