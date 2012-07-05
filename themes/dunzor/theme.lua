-- dunzor, awesome3 theme, by dunz0r

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
name     = 'dunzor'
themename     = '/' .. name
theme.theme_name = name
if not awful.util.file_readable(themes .. themename .. '/theme.lua') then
       themes = sharedthemes
end
themedir      = themes .. themename

wallpaper1    = themedir .. '/background.jpg'
wallpaper2    = themedir .. '/background.png'
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
theme.font          = 'fixed 9'

theme.bg_normal     = '#161616'
theme.bg_focus      = '#3e3e3e'
theme.bg_urgent     = '#6e3e3e'
theme.bg_minimize   = '#444444'

theme.fg_normal     = '#c8c8c8'
theme.fg_focus      = '#55aaff'
theme.fg_urgent     = '#ffffff'
theme.fg_minimize   = '#ffffff'

theme.bg_bottom     = '#161616' -- bottom panel color
theme.fg_bottom     = '#c8c8c8' -- bottom panel text color
theme.bg_graphs     = '#0f0f0f' -- graphs background color

-- specific
-- theme.fg_sb_hi           = '#9dcd9e'
-- theme.fg_batt_mid        = '#008600'
-- theme.fg_batt_low        = '#e4f01b'
-- theme.fg_batt_crit       = '#a84007'
-- theme.vol_bg             = '#000000'

theme.border_width  = '1'
theme.border_normal = '#000000'
theme.border_focus  = '#535d6c'
theme.border_marked = '#91231c'

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- Example:
--theme.taglist_bg_focus = '#ff0000'

-- Display the taglist squares
-- {{{ Taglist
theme.taglist_squares_sel   = themedir .. '/taglist/squarefz.png'
theme.taglist_squares_unsel = themedir .. '/taglist/squareza.png'
theme.taglist_squares_resize = 'false'
-- }}}

-- {{{ Misc
--theme.awesome_icon           = themedir .. '/shikamaru.png'
theme.menu_submenu_icon      = sharedthemes .. '/default/submenu.png'
theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'
-- }}}

-- {{{ Layout
theme.layout_tile       = themedir .. '/layouts/tile.png'
theme.layout_tileleft   = themedir .. '/layouts/tileleft.png'
theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
theme.layout_tiletop    = themedir .. '/layouts/tiletop.png'
theme.layout_fairv      = themedir .. '/layouts/fairv.png'
theme.layout_fairh      = themedir .. '/layouts/fairh.png'
theme.layout_spiral     = themedir .. '/layouts/spiral.png'
theme.layout_dwindle    = themedir .. '/layouts/dwindle.png'
theme.layout_max        = themedir .. '/layouts/max.png'
theme.layout_fullscreen = themedir .. '/layouts/fullscreen.png'
theme.layout_magnifier  = themedir .. '/layouts/magnifier.png'
theme.layout_floating   = themedir .. '/layouts/floating.png'
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themedir .. '/titlebar/close_focus.png'
theme.titlebar_close_button_normal = themedir .. '/titlebar/close_normal.png'

theme.titlebar_ontop_button_focus_active    = themedir .. '/titlebar/ontop_focus_active.png'
theme.titlebar_ontop_button_normal_active   = themedir .. '/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_inactive  = themedir .. '/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_inactive = themedir .. '/titlebar/ontop_normal_inactive.png'

theme.titlebar_sticky_button_focus_active    = themedir .. '/titlebar/sticky_focus_active.png'
theme.titlebar_sticky_button_normal_active   = themedir .. '/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_inactive  = themedir .. '/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_inactive = themedir .. '/titlebar/sticky_normal_inactive.png'

theme.titlebar_floating_button_focus_active    = themedir .. '/titlebar/floating_focus_active.png'
theme.titlebar_floating_button_normal_active   = themedir .. '/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_inactive  = themedir .. '/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_inactive = themedir .. '/titlebar/floating_normal_inactive.png'

theme.titlebar_maximized_button_focus_active    = themedir .. '/titlebar/maximized_focus_active.png'
theme.titlebar_maximized_button_normal_active   = themedir .. '/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_inactive  = themedir .. '/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_inactive = themedir .. '/titlebar/maximized_normal_inactive.png'

-- }}}
-- }}}
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
-- theme.awesome_icon = sharedicons .. '/awesome16.png'

-- calendar settings
theme.calendar_w         = 160
theme.calendar_fg        = theme.fg_normal
theme.calendar_bg        = theme.bg_normal


return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
