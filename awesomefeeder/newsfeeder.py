#!/usr/bin/python
"""
    Newsfeed-to-Json converter for Awesome
    Copyright (C) 2008  Bernd Zeimetz

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
"""


import ConfigParser
import os
import re
from subprocess import Popen, PIPE
import urllib

from BeautifulSoup import BeautifulSoup
import feedparser
import cjson 
from PIL import Image

basedir = "%s/.config/awesome/awesomefeeder" % (os.environ['HOME'])
imagedir = "%s/images" %(basedir)

favicon_re = re.compile(r'([^/]+://[^/]+).*')

def download(url, file):
    web_file = urllib.urlopen(url)
    local_file = open(file, 'w')
    local_file.write(web_file.read())
    web_file.close()
    local_file.close()

def find_favicon(url):
    base_url = favicon_re.findall(url)[0]
    base_url_file = urllib.urlopen(base_url)
    base_url_content = base_url_file.read()
    base_url_file.close()
    soup = BeautifulSoup(base_url_content)
    try:
        href = soup.html.head.findAll('link', attrs={'rel':'icon'})[0]['href']
        if href.find('://') > -1:
            return href
        return "%s/%s" %(base_url, href)
    except IndexError:
        return "%s/favicon.ico" %(base_url)
    

def download_favicon(url, file):
    file = "%s/%s" %(imagedir, file)
    try:
        favicon = find_favicon(re.findall(r'([^/]+://[^/]+).*', url)[0])
    except IndexError:
        return
    if favicon.lower().endswith('.png'):
        download(favicon, file + ".png")
    else:
        download_file = "%s.%s" %(file, favicon.split('.')[-1])
        download(favicon, download_file)
        convert_favicon_to_png(download_file, file + ".png")

def convert_favicon_to_png(favicon, favicon_png):
    image = Image.open(favicon)
    image.save(favicon_png ,"PNG")


config = ConfigParser.SafeConfigParser()
config.read("%s/newsfeeder.cfg" % (basedir))

result = []

for feed in config.sections():
    defaultimage = config.defaults()["image"]
    if not defaultimage.startswith('/'):
        defaultimage = "%s/%s" %(imagedir, defaultimage)

    feedicon_png = "%s.png" %(feed)
    image = "%s/%s" %(imagedir, feedicon_png)
    if not os.path.exists(image):
        try:
            feedicon_ico = download_favicon(config.get(feed, "feedurl"), feed)
        except:
            image = defaultimage

    baseurl = config.get(feed, "baseurl")
    limit = config.getint(feed, "limit")

    try:
        feeddata = feedparser.parse(config.get(feed, "feedurl"))
    except:
        continue

    for entry in feeddata["entries"][:limit]:
        title = entry["title"]
        link = entry["link"]

        result.append({"image" : image,
                       "title" : title,
                       "link" : link,
                       "baseurl" : baseurl})

json_file = open("%s/newsfeeder.json" % (basedir), 'w')
json_file.write(cjson.encode(result))
json_file.close()

command = 'awesomefeeder.update_news()\n'
awesome = Popen('/usr/bin/awesome-client', shell=False, stdin=PIPE).stdin
awesome.write(command)
awesome.close()

