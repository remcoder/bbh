import commands

class XsltException(Exception):
  pass

def transform(inputfile, stylesheet, outputfile, params = {}):

  p = " ".join(['--stringparam %s %s' % (k,v) for k,v in params.items()])

  cmd  = "xsltproc %s %s %s > %s" % (p, stylesheet, inputfile, outputfile)
  #print cmd
  code, error =  commands.getstatusoutput(cmd)
  if code != 0:
    raise XsltException(error)
