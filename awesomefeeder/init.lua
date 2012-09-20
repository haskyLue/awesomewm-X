----------------------------------------------------------------------------
-- @author Bernd Zeimetz <bzed@debian.org>
-- @copyright 2008 Bernd Zeimetz <bzed@debian.org>
----------------------------------------------------------------------------

--{{{
--  Newsfeed Widgets for Awesome
--  Copyright (C) 2008  Bernd Zeimetz <bzed@debian.org>
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--}}}

local awful = require('awful')
local widget = widget
local image = image
local button = button
local io = io
local os = os
local print = print

local hooks = require("awful.hooks")
local util = require("awful.util")
local json = require("json")

local basedir = os.getenv('HOME') .. '/.config/awesome/awesomefeeder'

module("awesomefeeder")

-- newsreader widgets
local newswidgets = {}
local newsurls = {}
-- Spawn browser with URL
local function spawn_browser(url)
    if not url then url = '' end
    util.spawn('/usr/bin/x-www-browser ' .. url)
end

-- last update time
local last_update = 0
-- Spawn the python newsfeed parser
local function spawn_update()
    -- make sure we don't spawn newsfeeder.py too often.
    if (os.time() - last_update) < 60 then
        return
    end

    util.spawn('/usr/bin/nice /usr/bin/python '
               .. basedir
               .. '/newsfeeder.py')
    last_update = os.time()
end

-- news to display
local news = {}
-- currently displayed news entry
local news_entry = 0
-- Update News table
-- @param json_news News from newsfeeder.py, formatted in json
-- @usage awesomefeeder.update_news("json encoded test")
function update_news()
    local file = io.open( basedir .. '/newsfeeder.json', r)
    if not file then
        news = {}
        return
    end
    local json_news = file:read("*all")
    file:close()
    news = json.decode(json_news)
    news_entry = 0
end

-- Show next News entry
-- @usage awesomefeeder.show_news()
function show_news()
    if not (newswidgets.icon and newswidgets.title) then
        return
    end
    if news_entry < #news then
        news_entry = news_entry + 1
        local current_entry = news[news_entry]
        newswidgets.icon.image = image(current_entry['image'])
        newsurls.icon = current_entry['baseurl']
        newswidgets.title.text = ' ' .. current_entry['title'] .. ' '
        newsurls.title = current_entry['link']
    else
        spawn_update()
    end
end


-- Initialize and return widgets
-- @param align Widget alignment, defaults to "right"
-- @param time Time to wait until the next news entry is displayed
-- @usage awesomefeeder.widgets("right", 5)
-- @return table containing image + text widget in the order for the given alignment.
function widgets(align, time)

    if not (align == "left" or align == "right") then
        align = "right"
    end
    if not time then
        time = 10
    end

    if not newswidgets.icon then
        newswidgets.icon = widget({ type = "imagebox", align = align })
        newswidgets.icon:buttons({ awful.util.table.join(
            awful.button({ }, 1, function ()
                if newsurls.icon then
                    spawn_browser(newsurls.icon)
                end
            end)
        )})
    end
    if not newswidgets.title then
        newswidgets.title  = widget({ type = "textbox",  align = align })
        newswidgets.title:buttons({ awful.util.table.join(
            awful.button({ }, 1, function ()
                if newsurls.title then
                    spawn_browser(newsurls.title)
                end
            end),
            awful.button({ }, 4, function ()
                if news_entry == 0 then
                    news_entry = #news - 1
                else
                    if news_entry == 1 then
                        news_entry = #news
                    else
                        news_entry = news_entry - 2
                    end
                end
                show_news()
            end),
            awful.button({ }, 5, function ()
                if not (news_entry < #news) then
                    news_entry = 0
                end
                show_news()
            end)
        )})
        update_news()
        hooks.timer.register(time, show_news)
    end

    return {newswidgets.title, newswidgets.icon}
end


