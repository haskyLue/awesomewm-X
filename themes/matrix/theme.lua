-- matrix, awesome3 theme, by ShdB --

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
name = 'matrix'
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
theme.menu_icons    = 'gnome' -- look inside /usr/share/icons/, default: nil (don't use icon theme)
theme.font          = 'snap'

theme.bg_normal     = '#171717'
theme.bg_focus      = '#171717'
theme.bg_urgent     = '#171717'
theme.bg_minimize   = '#171717'

theme.hilight       = '#ffcc44'

theme.fg_normal     = '#449900'
theme.fg_focus      = '#66FF00'
theme.fg_urgent     = '#cc0000'

theme.bg_bottom     = '#171717' -- bottom panel color
theme.fg_bottom     = '#449900' -- bottom panel text color
theme.bg_graphs     = '#171717' -- graphs background color

theme.graph_bg      = '#333333'
theme.graph_center  = '#779900'
theme.graph_end     = '#ff9900'

theme.border_width  = '1'
theme.border_normal = '#338000'
theme.border_focus  = '#66FF00'
theme.border_marked = '#66FF00'

theme.menu_height   = '10'
theme.menu_width    = '100'

theme.taglist_squares = 'true'
theme.awesome_icon = home_path .. '.config/awesome/icons/menu_icon.png'

-- theme.battery = themes .. '/icons/him/battery.png'
-- theme.volume = themes .. '/icons/him/volume.png'
-- theme.muted = themes .. '/icons/him/muted.png'
-- theme.cpu = themes .. '/icons/him/cpu.png'
-- theme.temp = themes .. '/icons/him/temp.png'
-- theme.mail = themes .. '/icons/him/mail.png'
-- theme.mem = themes .. '/icons/him/mem.png'
-- theme.wireless = themes .. '/icons/him/wireless.png'
-- theme.network = themes .. '/icons/him/network.png'
-- theme.mpd_play = themes .. '/icons/him/mpd_play.png'
-- theme.mpd_pause = themes .. '/icons/him/mpd_pause.png'
-- theme.mpd_stop = themes .. '/icons/him/mpd_stop.png'

theme.layout_fairh = themedir .. '/layouts/fairh.png'
theme.layout_fairv = themedir .. '/layouts/fairv.png'
theme.layout_floating = themedir .. '/layouts/floating.png'
theme.layout_max = themedir .. '/layouts/max.png'
theme.layout_spiral = themedir .. '../default/layouts/spiralw.png'
theme.layout_tilebottom = themedir .. '/layouts/tilebottom.png'
theme.layout_tile = themedir .. '/layouts/tile.png'

return theme
