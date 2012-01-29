#!/usr/bin/env python

import sys,os,os.path,glob,commands,xslt,json

errors = 0

# script should always be run from the project root
output = 'www'

content = 'src/content'
templates = 'src/templates'
css = 'src/css'
img = 'src/img'
js = 'src/js'
htaccess = 'src/.htaccess'


with open('src/tools/pages.json', 'r') as f:
  pagedb = json.loads(f.read())

#print pagedb

# pages
def Pages():
  # pattern = os.path.join(content, '*.xml')

  # for file in glob.glob(pattern):
  #   filename = os.path.split(file)[1]
  #   basename = os.path.splitext(filename)[0]
  #   yield basename
  for pageid in pagedb["pages"]:
    yield pageid

def getCss(page_id):
  filename = page_id + ".css"
  path = os.path.join(css, filename)
  if os.path.isfile(path):
    return os.path.join("css",  page_id + ".css")

def clean():
  commands.getstatusoutput("rm -rf %s" % (os.path.join(output,'*')))

def copyStatics():
  commands.getstatusoutput("rsync -aC %s %s" % (css,output))
  commands.getstatusoutput("rsync -aC %s %s" % (img,output))
  commands.getstatusoutput("rsync -aC %s %s" % (js, output))
  commands.getstatusoutput("cp -a %s %s" % (htaccess, output))

def createPage(page_id):

  xsl = os.path.join(templates, 'page.xslt')

  params = {}
  params['page_id'] = page_id
  css = getCss(page_id)
  if css:
    params['css'] = css

  # get translations
  for lang in ["nl", "en"]:
    params["lang"] = lang

    xml = os.path.join(content, lang, page_id + '.xml')

    if lang == "nl":
      html = os.path.join(output, page_id + '.html')
    else:
      html = os.path.join(output, lang, page_id + '.html')
    try:
      xslt.transform(xml, xsl, html, params)
      print "\t" + html
    except xslt.XsltException as e:
      global errors
      errors+=1
      print e


print "cleaning..."
clean()

print "copying static files..."
copyStatics()

commands.getstatusoutput("mkdir %s" % os.path.join(output, "en"))

print "applying templates...\n"

pages = list(Pages())
for page_id in pages:
  createPage(page_id)

print

#print "\n%s pages created successfully" % (len(pages) - errors)
if errors > 0: print "%s error(s)" % errors
else: print "done!"
