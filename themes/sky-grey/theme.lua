-- sky-grey, awesome3 theme, by Andrei 'Garoth' Thorp, modified by macgrey
-- If you want SVGs and extras, get them from garoth.com/awesome/sky-theme

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
name = 'sky-grey'
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
theme.menu_icons = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
theme.font          = 'sans 8'

theme.bg_focus      = '#E8E7E6' -- '#e2eeea'
theme.bg_normal     = '#bdbdbd' -- gentoo-purple -- '#729fcf'
theme.bg_urgent     = '#fce94f'
theme.bg_minimize   = '#797979'

theme.fg_normal     = '#2e3436'
theme.fg_focus      = '#2e3436'
theme.fg_urgent     = '#2e3436'
theme.fg_minimize   = '#2e3436'

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

theme.bg_bottom     = '#bdbdbd' -- bottom panel color
theme.fg_bottom     = '#2e3436' -- bottom panel text color
theme.bg_graphs     = '#797979' -- graphs background color

theme.border_width  = '1'
theme.border_normal = '#dae3e0'
theme.border_focus  = theme.bg_normal -- '#729fcf'
theme.border_marked = '#eeeeec'

theme.menu_bg_focus = theme.bg_normal -- '#7985A3'
theme.menu_bg_normal = theme.bg_focus -- '#454545'
theme.menu_border_color = '#7985A3'

-- IMAGES
theme.layout_fairh           = sharedthemes .. '/sky/layouts/fairh.png'
theme.layout_fairv           = sharedthemes .. '/sky/layouts/fairv.png'
theme.layout_floating        = sharedthemes .. '/sky/layouts/floating.png'
theme.layout_magnifier       = sharedthemes .. '/sky/layouts/magnifier.png'
theme.layout_max             = sharedthemes .. '/sky/layouts/max.png'
theme.layout_fullscreen      = sharedthemes .. '/sky/layouts/fullscreen.png'
theme.layout_tilebottom      = sharedthemes .. '/sky/layouts/tilebottom.png'
theme.layout_tileleft        = sharedthemes .. '/sky/layouts/tileleft.png'
theme.layout_tile            = sharedthemes .. '/sky/layouts/tile.png'
theme.layout_tiletop         = sharedthemes .. '/sky/layouts/tiletop.png'

-- theme.icon_theme = 'Tango'
-- theme.icon_theme_size = '32x32'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
--theme.awesome_icon = config .. '/icons/im-aim.png'
-- theme.clientmenu_icon = sharedicons .. '/icons/awesome16.png'
--theme.default_client_icon = config .. '/icons/float.gif'
--theme.xvkbd_icon = config .. '/icons/keyboard.png'
theme.tasklist_floating_icon = sharedthemes .. '/sky/layouts/floating.png'

-- from default for now...
theme.menu_submenu_icon     = sharedthemes .. '/default/submenu.png'
theme.taglist_squares_sel   = sharedthemes .. '/default/taglist/squarefw.png'
theme.taglist_squares_unsel = sharedthemes .. '/default/taglist/squarew.png'

-- MISC
theme.taglist_squares       = 'true'
theme.titlebar_close_button = 'true'
theme.menu_width            = '200'
theme.menu_height           = 24
theme.menu_context_height   = 20
theme.menu_border_width     = 0

theme.wibox_bottom_height = 14
theme.wibox_height = 22

-- Define the image to load
theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close_normal.png'
theme.titlebar_close_button_focus = sharedthemes .. '/default/titlebar/close_focus.png'

theme.titlebar_ontop_button_normal_inactive = sharedthemes .. '/default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive = sharedthemes .. '/default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = sharedthemes .. '/default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active = sharedthemes .. '/default/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = sharedthemes .. '/default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive = sharedthemes .. '/default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = sharedthemes .. '/default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active = sharedthemes .. '/default/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = sharedthemes .. '/default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive = sharedthemes .. '/default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = sharedthemes .. '/default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active = sharedthemes .. '/default/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = sharedthemes .. '/default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive = sharedthemes .. '/default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = sharedthemes .. '/default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active = sharedthemes .. '/default/titlebar/maximized_focus_active.png'

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
