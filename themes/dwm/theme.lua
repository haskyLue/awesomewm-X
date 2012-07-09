-- dwm, awesome3 theme

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
name = 'dwm'
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

-- theme.font          = 'Monospace 8'
-- theme.font          = 'fixed 8'
-- theme.font          = 'Sans 8'
theme.font          = 'Terminus 8'

theme.bg_normal     = '#cccccc'
theme.bg_focus      = '#0066ff'
theme.bg_urgent     = '#ffdd00'

theme.fg_normal     = '#000000'
theme.fg_focus      = '#ffffff'
theme.fg_urgent     = '#111111'

theme.bg_bottom     = '#cccccc' -- bottom panel color
theme.fg_bottom     = '#000000' -- bottom panel text color
theme.bg_graphs     = '#797979' -- graphs background color

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

theme.border_width  = 2
theme.border_normal = '#cccccc'
theme.border_focus  = '#0066ff'

theme.taglist_squares_sel    = themedir .. '/tasklist_f.png'
theme.taglist_squares_unsel  = themedir .. '/tasklist_u.png'
theme.tasklist_floating_icon = themedir .. '/floating.png'

theme.titlebar_close_button_normal = sharedthemes .. '/default/titlebar/close.png'
theme.titlebar_close_button_focus  = sharedthemes .. '/default/titlebar/closer.png'

theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'
-- theme.awesome_icon = sharedicons .. '/awesome16.png'

return theme
