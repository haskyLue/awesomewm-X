---------------------------
-- light2x awesome theme --
---------------------------

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
name = 'pdqlight2x'
themename     = '/' .. name
theme.theme_name = name
if not awful.util.file_readable(themes .. themename .. '/theme.lua') then
       themes = sharedthemes
end
themedir      = themes .. themename

if script_options.global == nil then
    theme.wpscript     = themedir .. '/script.sh'
else
    theme.wpscript     = config .. '/globalscript.sh'
end

if awful.util.file_readable(theme.wpscript) then
    theme.wallpaper_cmd = { 'sh ' .. theme.wpscript .. ' ' .. script_run }
end

if awful.util.file_readable(config .. '/vain/init.lua') then
    theme.useless_gap_width  = '3'
end
--}}}

theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

theme.font          = 'Envy Code R 9' -- 'font name size'

theme.bg_normal     = '#D7D7D7'
theme.bg_focus      = '#EEEEEE'
theme.bg_urgent     = '#ff0000'
theme.bg_minimize   = '#D4D4D4'

theme.fg_normal     = '#000000'
theme.fg_focus      = '#000000'
theme.fg_urgent     = '#000000'
theme.fg_minimize   = '#0f0f0f'

-- {{{ Widgets
theme.fg_widget        = "#AECF96"
theme.fg_center_widget = "#88A175"
theme.fg_end_widget    = "#FF5656"
theme.fg_off_widget    = "#494B4F"
theme.fg_netup_widget  = "#7F9F7F"
theme.fg_netdn_widget  = theme.fg_urgent
theme.bg_widget        = theme.bg_normal
theme.border_widget    = theme.bg_normal
-- }}}

theme.bg_bottom     = '#D7D7D7' -- bottom panel color
theme.fg_bottom     = '#000000' -- bottom panel text color
theme.bg_graphs     = '#6E6E6E' -- graphs background color

theme.border_width  = '0'
theme.border_normal = '#000000'
theme.border_focus  = '#000000'
theme.border_marked = '#000000'

-- Display the taglist squares
theme.taglist_squares_sel   = sharedthemes .. '/default/taglist/squarefw.png'
theme.taglist_squares_unsel = sharedthemes .. '/default/taglist/squarew.png'

theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
theme.menu_height = '15'
theme.menu_width  = '100'

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = '#cc0000'

-- Define the image to load
theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close_normal.png'
theme.titlebar_close_button_focus  = sharedthemes .. '/default/titlebar/close_focus.png'

theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive  = sharedthemes .. '/default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = sharedthemes .. '/default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active  = sharedthemes .. '/default/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive  = sharedthemes .. '/default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = sharedthemes .. '/default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active  = sharedthemes .. '/default/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive  = sharedthemes .. '/default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = sharedthemes .. '/default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active  = sharedthemes .. '/default/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive  = sharedthemes .. '/default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = sharedthemes .. '/default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active  = sharedthemes .. '/default/titlebar/maximized_focus_active.png'

theme.layout_fairh = sharedthemes .. '/default/layouts/fairhw.png'
theme.layout_fairv = sharedthemes .. '/default/layouts/fairvw.png'
theme.layout_floating  = sharedthemes .. '/default/layouts/floatingw.png'
theme.layout_magnifier = sharedthemes .. '/default/layouts/magnifierw.png'
theme.layout_max = sharedthemes .. '/default/layouts/maxw.png'
theme.layout_fullscreen = sharedthemes .. '/default/layouts/fullscreenw.png'
theme.layout_tilebottom = sharedthemes .. '/default/layouts/tilebottomw.png'
theme.layout_tileleft   = sharedthemes .. '/default/layouts/tileleftw.png'
theme.layout_tile = sharedthemes .. '/default/layouts/tilew.png'
theme.layout_tiletop = sharedthemes .. '/default/layouts/tiletopw.png'
theme.layout_spiral  = sharedthemes .. '/default/layouts/spiralw.png'
theme.layout_dwindle = sharedthemes .. '/default/layouts/dwindlew.png'

--theme.awesome_icon = home_path .. '.config/awesome/icons/awesome16.png'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
-- theme.start_here_icon = home_path .. '.config/awesome/icons/Gentoo.png'
-- theme.mspacman_icon = home_path .. '.config/awesome/icons/1.jpeg'
-- theme.pacman_icon = home_path .. '.config/awesome/icons/th_Ghost_blue2.gif'

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
