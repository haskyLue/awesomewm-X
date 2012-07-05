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

-- theme.font          = 'Monospace 8'
-- theme.font          = 'fixed 8'
-- theme.font          = 'Sans 8'
theme.font          = 'Terminus 8'
-- theme.font          = 'FreeMono 9'
-- theme.font          = 'Droid Sans Mono 8'

theme.bg_normal     = '#cccccc'
theme.bg_focus      = '#0066ff'
theme.bg_urgent     = '#ffdd00'

theme.fg_normal     = '#000000'
theme.fg_focus      = '#ffffff'
theme.fg_urgent     = '#111111'

theme.bg_bottom     = '#cccccc' -- bottom panel color
theme.fg_bottom     = '#000000' -- bottom panel text color
theme.bg_graphs     = '#797979' -- graphs background color

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
