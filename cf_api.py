#!/usr/bin/env python
# -*- coding: utf-8 -*-

__author__ = 'Said Sef'

import requests as r
import json
import time
import os
import ConfigParser
from optparse import OptionParser

CONFIG_FILE='custom.cfg'

def config_read():
  config = ConfigParser.ConfigParser()
  config.read(CONFIG_FILE)
  return config

config = config_read()

tkn   = config.get('cloudflare','tkn')
email = config.get('cloudflare','email')

parser = OptionParser()
parser.add_option("-s", "--site", dest="site", help="site name - abc.com", metavar="SITE")
parser.add_option("-t", "--task", dest="task", help="task name - [all,devmode,purge,file_purge]", metavar="TASK")
parser.add_option("-u", "--url",  dest="url", help="url name - /this-is-a-url", metavar="URL")
(options, args) = parser.parse_args()

if not options.site:
  parser.error('Site name not given')
if not options.task:
  parser.error('Task name not given')

site = options.site
task = options.task

if "file_purge" in task and not options.url:
  parser.error('URL name not given')
elif "file_purge" in task and options.url:
  url = options.url

params = {
  'tkn': tkn,
  'email': email,
  'z': site
  }

if "all" in task:
  params.update({'a':'rec_load_all'})
if "devmode" in task:
  params.update({'a': 'devmode', 'v': '1'})
if "purge" in task:
  params.update({'a': 'fpurge_ts', 'v': '1'})
if "file_purge" in task:
  params.update({'a': 'zone_file_purge', 'v': '1', 'url': url})

j = r.post("https://www.cloudflare.com/api_json.html", params=params)
j = j.json()

print '|==>', 'result', j['result'], '<==|'
print json.dumps(j, sort_keys=False, indent=2)
