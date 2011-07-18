#!/usr/bin/python2.6
#
# Copyright 2011 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import sys
from ppm_header import ppm_header

def insert_pagefeed(linesize):
  # sys.stderr.write("Pagefeed created\n")  
  sys.stdout.write("Pagefeed")
  for i in range(linesize - 8):
    sys.stdout.write(" ")

def detect_pagefeed(scanline):
  if scanline[0:8] == "Pagefeed":
    # sys.stderr.write("Pagefeed detected\n")  
    return True
  else:
    return False


def write_ppm(page_number, scanlines):
  w = len(scanlines[0]) / 3
  h = len(scanlines)
  if h < w/4:   # About two inches
    return False
  kDir = "/tmp/playground" 
  if not os.path.exists(kDir):
    os.mkdir(kDir)
  filename = os.path.join(kDir, "page-%d.ppm" % page_number)
  f = open(filename, "wb")
  f.write("P6\n%d %d\n255\n" % (w, h))
  for i in range(h):
    f.write(scanlines[i])
  f.close()
  return True

def process():
  linesize, linecount = ppm_header()
  page_number = 0
  scanlines = []
  while True:
    scanline = sys.stdin.read(linesize)
    if len(scanline) != linesize:
      break
    if detect_pagefeed(scanline):
      if write_ppm(page_number, scanlines):
        page_number += 1
      scanlines = []
    scanlines.append(scanline)

if __name__ == "__main__":
  process()
