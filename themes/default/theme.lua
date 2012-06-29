---------------------------
-- Default awesome theme --
---------------------------
path_to_dir    = '/home/pdq/'

theme = {}

-- theme.font          = 'Envy Code R 9'
theme.font          = 'Envy Code R 9'
theme.bg_normal     = '#222222'
-- theme.bg_normal     = '#DEDAD9'
theme.bg_focus      = '#0f0f0f'
-- theme.bg_focus      = '#AEA7A3'
theme.bg_urgent     = '#ff0000'
theme.bg_minimize   = '#222222'

theme.fg_normal     = '#D7D0C7'
theme.fg_focus      = '#FFFFFF'
theme.fg_urgent     = '#000000'
theme.fg_minimize   = '#7F7F7F'

theme.border_width  = '0'
theme.border_normal = '#000000'
theme.border_focus  = '#000000'
theme.border_marked = '#000000'

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = '#ff0000'

-- Display the taglist squares
theme.taglist_squares_sel   = path_to_dir .. '.config/awesome/themes/default/taglist/squarefw.png'
theme.taglist_squares_unsel = path_to_dir .. '.config/awesome/themes/default/taglist/squarew.png'

theme.tasklist_floating_icon = path_to_dir .. '.config/awesome/themes/default/tasklist/floatingw.png'

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = path_to_dir .. '.config/awesome/themes/default/submenu.png'
theme.menu_height = '22'
theme.menu_width  = '150'

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = '#cc0000'

-- Define the image to load
theme.titlebar_close_button_normal = path_to_dir .. '.config/awesome/themes/default/titlebar/close_normal.png'
theme.titlebar_close_button_focus  = path_to_dir .. '.config/awesome/themes/default/titlebar/close_focus.png'

theme.titlebar_ontop_button_normal_inactive = path_to_dir .. '.config/awesome/themes/default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive  = path_to_dir .. '.config/awesome/themes/default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = path_to_dir .. '.config/awesome/themes/default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active  = path_to_dir .. '.config/awesome/themes/default/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = path_to_dir .. '.config/awesome/themes/default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive  = path_to_dir .. '.config/awesome/themes/default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = path_to_dir .. '.config/awesome/themes/default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active  = path_to_dir .. '.config/awesome/themes/default/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = path_to_dir .. '.config/awesome/themes/default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive  = path_to_dir .. '.config/awesome/themes/default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = path_to_dir .. '.config/awesome/themes/default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active  = path_to_dir .. '.config/awesome/themes/default/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = path_to_dir .. '.config/awesome/themes/default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive  = path_to_dir .. '.config/awesome/themes/default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = path_to_dir .. '.config/awesome/themes/default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active  = path_to_dir .. '.config/awesome/themes/default/titlebar/maximized_focus_active.png'

-- You can use your own command to set your wallpaper
-- theme.wallpaper_cmd = { 'awsetbg /home/pdq/.config/awesome/themes/default/background.png' }
-- theme.wallpaper_cmd = { 'awsetbg /home/pdq/.config/conky/lcars.png' }
-- theme.wallpaper_cmd = { 'nitrogen --restore' }
theme.wallpaper_cmd = {"awsetbg -t -f -r " .. path_to_dir .. "Pictures/morewallpapers/"}
theme.layout_fairh = path_to_dir .. '.config/awesome/themes/default/layouts2/fairhw.png'
theme.layout_fairv = path_to_dir .. '.config/awesome/themes/default/layouts2/fairvw.png'
theme.layout_floating  = path_to_dir .. '.config/awesome/themes/default/layouts2/floatingw.png'
theme.layout_magnifier = path_to_dir .. '.config/awesome/themes/default/layouts2/magnifierw.png'
theme.layout_max = path_to_dir .. '.config/awesome/themes/default/layouts2/maxw.png'
theme.layout_fullscreen = path_to_dir .. '.config/awesome/themes/default/layouts2/fullscreenw.png'
theme.layout_tilebottom = path_to_dir .. '.config/awesome/themes/default/layouts2/tilebottomw.png'
theme.layout_tileleft   = path_to_dir .. '.config/awesome/themes/default/layouts2/tileleftw.png'
theme.layout_tile = path_to_dir .. '.config/awesome/themes/default/layouts2/tilew.png'
theme.layout_tiletop = path_to_dir .. '.config/awesome/themes/default/layouts2/tiletopw.png'
theme.layout_spiral  = path_to_dir .. '.config/awesome/themes/default/layouts2/spiralw.png'
theme.layout_dwindle = path_to_dir .. '.config/awesome/themes/default/layouts2/dwindlew.png'

theme.awesome_icon = path_to_dir .. '.config/awesome/icons/awesome16.png'
theme.arch_icon = path_to_dir .. '.config/awesome/icons/start-here monochrome light.png'
theme.mspacman_icon = path_to_dir .. '.config/awesome/icons/1.jpeg'
theme.pacman_icon = path_to_dir .. '.config/awesome/icons/th_Ghost_blue2.gif'

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
