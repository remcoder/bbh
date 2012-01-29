#!/usr/bin/env python

import os,os.path,glob,commands

# FIXME: It would be better to parse the paths properly so we can run resample.py from anywhere

# works only on OS X, AFAIK
def resample(pattern, max_size):
  for file in glob.glob(pattern):
    cmd = "sips -Z %s %s --out small/%s" % (max_size,file,file)
    print cmd
    commands.getstatusoutput(cmd)

for pattern in ["*.jpg"]:
  resample(pattern, 175)
