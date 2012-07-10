-- dust, awesome3 theme, based off of the gtk+ theme dust, by tdy

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
name = 'dust'
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

theme.font          = 'clean 8'

theme.bg_normal     = '#22222200'
theme.bg_focus      = '#908884'
theme.bg_urgent     = '#cd7171'
theme.bg_minimize   = '#444444'

theme.fg_normal     = '#aaaaaa'
theme.fg_focus      = '#111111'
theme.fg_urgent     = '#ffffff'
theme.fg_minimize   = '#ffffff'

theme.bg_bottom     = '#22222200' -- bottom panel color
theme.fg_bottom     = '#aaaaaa' -- bottom panel text color
theme.bg_graphs     = '#0f0f0f' -- graphs background color

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

theme.border_width  = '1'
theme.border_normal = '#222222'
theme.border_focus  = '#908884'
theme.border_marked = '#91231c'

theme.taglist_squares_sel = themedir .. '/taglist14/squaref.png'
theme.taglist_squares_unsel = themedir .. '/taglist14/square.png'

theme.tasklist_floating_icon = sharedthemes .. '/default/tasklist/floatingw.png'

theme.menu_submenu_icon = sharedthemes .. '/default/submenu.png'
theme.menu_height   = '15'
theme.menu_width    = '100'

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

theme.layout_fairh      = themedir .. '/layouts14/fairhw.png'
theme.layout_fairv      = themedir .. '/layouts14/fairvw.png'
theme.layout_floating   = themedir .. '/layouts14/floatingw.png'
theme.layout_magnifier  = themedir .. '/layouts14/magnifierw.png'
theme.layout_max        = themedir .. '/layouts14/maxw.png'
theme.layout_fullscreen = themedir .. '/layouts14/fullscreenw.png'
theme.layout_tilebottom = themedir .. '/layouts14/tilebottomw.png'
theme.layout_tileleft   = themedir .. '/layouts14/tileleftw.png'
theme.layout_tile       = themedir .. '/layouts14/tilew.png'
theme.layout_tiletop    = themedir .. '/layouts14/tiletopw.png'
theme.layout_spiral     = themedir .. '/layouts14/spiralw.png'
theme.layout_dwindle    = themedir .. '/layouts14/dwindlew.png'

-- theme.awesome_icon = themedir .. '/awesome14-dust.png'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

theme.widget_disk     = themes .. '/icons/dust/disk.png'
theme.widget_ac       = themes .. '/icons/dust/ac.png'
theme.widget_acblink  = themes .. '/icons/dust/acblink.png'
theme.widget_blank    = themes .. '/icons/dust/blank.png'
theme.widget_batfull  = themes .. '/icons/dust/batfull.png'
theme.widget_batmed   = themes .. '/icons/dust/batmed.png'
theme.widget_batlow   = themes .. '/icons/dust/batlow.png'
theme.widget_batempty = themes .. '/icons/dust/batempty.png'
theme.widget_vol      = themes .. '/icons/dust/vol.png'
theme.widget_mute     = themes .. '/icons/dust/mute.png'
theme.widget_pac      = themes .. '/icons/dust/pac.png'
theme.widget_pacnew   = themes .. '/icons/dust/pacnew.png'
theme.widget_mail     = themes .. '/icons/dust/mail.png'
theme.widget_mailnew  = themes .. '/icons/dust/mailnew.png'
theme.widget_temp     = themes .. '/icons/dust/temp.png'
theme.widget_tempwarm = themes .. '/icons/dust/tempwarm.png'
theme.widget_temphot  = themes .. '/icons/dust/temphot.png'
theme.widget_wifi     = themes .. '/icons/dust/wifi.png'
theme.widget_nowifi   = themes .. '/icons/dust/nowifi.png'
theme.widget_mpd      = themes .. '/icons/dust/mpd.png'
theme.widget_play     = themes .. '/icons/dust/play.png'
theme.widget_pause    = themes .. '/icons/dust/pause.png'
theme.widget_ram      = themes .. '/icons/dust/ram.png'

theme.widget_mem      = themes .. '/icons/dust12/ram.png'
theme.widget_swap     = themes .. '/icons/dust12/swap.png'
theme.widget_fs       = themes .. '/icons/dust12/fs_01.png'
theme.widget_fs2      = themes .. '/icons/dust12/fs_02.png'
theme.widget_up       = themes .. '/icons/dust12/up.png'
theme.widget_down     = themes .. '/icons/dust12/down.png'

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
