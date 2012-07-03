-- blue, awesome3 theme, by: bioe007 perrydothargraveatgmaildotcom

--{{{ Main
require('awful.util')

theme = {}

config        = awful.util.getdir('config')
shared        = '/usr/share/awesome'
if not awful.util.file_readable(shared .. '/icons/awesome16.png') then
    shared    = '/usr/share/local/awesome'
end
sharedicons   = shared .. '/icons'
sharedthemes  = shared .. '/themes'
themes        = config .. '/themes'
name = 'blue'
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
wpscript      = home_path .. '/.wallpaper'
wpscript2     = themedir .. '/conky.sh'

if awful.util.file_readable(wpscript2) then
	theme.wallpaper_cmd = { 'sh ' .. wpscript2 }
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

theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)

white      = '#ffffff'
blue_dark  = '#486274'
blue_light = '#839ab1'
nearwhite  = '#efffff'

theme.font     = 'HeldustryFTVBasic Black 8'

theme.bg_normal     = blue_dark
theme.bg_focus      = blue_light
theme.bg_urgent     = '#288ef6'
theme.fg_normal     = '#b9b9dd'
theme.fg_focus      = nearwhite
theme.fg_urgent     = white

theme.bg_bottom     = blue_dark -- bottom panel color
theme.fg_bottom     = '#b9b9dd' -- bottom panel text color
theme.bg_graphs     = '#374B59' -- graphs background color

-- specific
theme.fg_sb_hi      = '#dfdfff'
theme.fg_batt_mid   = '#00cb00'
theme.fg_batt_low   = '#e6f21d'
theme.fg_batt_crit  = '#f8700a'
theme.widg_cpu_st   = '#243367'
theme.widg_cpu_mid  = '#285577'
theme.widg_cpu_end  = '#AEC6D8'
theme.vol_bg        = '#000033'

theme.border_width  = 1
theme.border_normal = '#000124'
theme.border_focus  = '#4148ea'
theme.border_marked = '#0000f0'

-- calendar settings
theme.calendar_w  = 160
theme.calendar_fg = nearwhite
theme.calendar_bg = blue_dark

-- menu settings
theme.menu_height = 15
theme.menu_width = 100

theme.titlebar_bg_focus = blue_light
theme.titlebar_bg_normal = blue_dark

  -- Display the taglist squares
theme.taglist_squares = true
theme.taglist_squares_sel = themedir .. '/taglist/squarefw.png'
theme.taglist_squares_unsel = themedir .. '/taglist/squarew.png'

theme.tasklist_floating_icon = themedir .. '/tasklist/float.gif'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

  -- Display close button inside titlebar
theme.titlebar_close_button = true

  -- Define the image to load
  -- @ (if titlebar_close_button_[normal|focus] these values are ignored)
theme.titlebar_close_button_normal = themedir .. '/titlebar/close-inactive.png'
theme.titlebar_close_button_focus  = themedir .. '/titlebar/close-active.png'

  -- You can use your own layout icons like this:
theme.layout_dwindle    = themedir .. '/layouts/dwindlew.png'
theme.layout_fairh      = themedir .. '/layouts/fairhw.png'
theme.layout_fairv      = themedir .. '/layouts/fairvw.png'
theme.layout_floating   = themedir .. '/layouts/floatingw.png'
theme.layout_magnifier  = themedir .. '/layouts/magnifierw.png'
theme.layout_max        = themedir .. '/layouts/maxw.png'
theme.layout_spiral     = themedir .. '/layouts/spiralw.png'
theme.layout_tilebottom = themedir .. '/layouts/tilebottomw.png'
theme.layout_tileleft   = themedir .. '/layouts/tileleftw.png'
theme.layout_tile       = themedir .. '/layouts/tilew.png'
theme.layout_tiletop    = themedir .. '/layouts/tiletopw.png'

return theme
-- vim:set filetype=lua textwidth=80 fdm=marker tabstop=4 shiftwidth=4 expandtab smarttab autoindent smartindent: --