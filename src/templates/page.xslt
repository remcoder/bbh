<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:fb="http://www.facebook.com/2008/fbml">

<!-- html5 compliant doctype. see html5 spec at w3c -->
<xsl:output method="html" encoding="UTF-8" doctype-system="'about:legacy-compat'" />

<xsl:param name="page_id" />
<xsl:param name="css" />
<xsl:param name="lang" />

<xsl:include href="navigation.xslt" />

  <xsl:template match="/page">
    <html xmlns:fb="http://www.facebook.com/2008/fbml">
      <head>
        <meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1"/>

        <!-- webmaster tools: https://www.google.com/webmasters -->
        <meta name="google-site-verification" content="ZWphtKKU9_Os62Oqjn7Q1h6UdtCq6XcsbyEimm947uY" />

        <meta name="Description" content="{description/text()}" />
        <meta name="geo.placename" content="Van Barbansonstraat 66, 2274 Voorburg, The Netherlands" />
        <meta name="geo.position" content="52.073865;4.348078" />
        <meta name="geo.region" content="NL-South Holland" />
        <meta name="ICBM" content="52.073865, 4.348078" />

        <link rel="shortcut icon" href="img/favicon.ico" />
        <link href='http://fonts.googleapis.com/css?family=Buda:light' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" href="/css/common.css" type="text/css" media="screen" charset="utf-8" />
        <xsl:if test="$css">
          <link rel="stylesheet" href="/{$css}" type="text/css" media="screen" charset="utf-8" />
        </xsl:if>

        <xsl:comment><![CDATA[[if lt IE 9]>
            <link rel="stylesheet" href="/css/ie.css" type="text/css" media="screen" charset="utf-8" />
        <![endif]]]></xsl:comment>

        <xsl:comment><![CDATA[[if IE 6]>
            <link rel="stylesheet" href="/css/ie6.css" type="text/css" media="screen" charset="utf-8" />
          <![endif]]]></xsl:comment>

        <link rel="stylesheet" href="/css/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
        <title><xsl:value-of select="title"/><xsl:if test="title"> | </xsl:if>Balance by Hands | Voorburg</title>
      </head>
      <body class="{$page_id}">
        <div class="glass bar">
        </div>
        <div class="button_holder bar">
          <a href="#" class="close-button" ></a>
          <div class="ilike">
            <iframe id="fb_like" src="http://www.facebook.com/plugins/like.php?href=http://balancebyhands.nl&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;font&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true"></iframe>
          </div>

        </div>

        <div class='background'>
          <img width="100%" height="100%" src="" alt="landschap en boom en in de achtergrond" />
        </div>

        <xsl:apply-templates select="." mode="navigation" />

        <xsl:if test="story">
          <div class='page bubble'>

            <xsl:if test="(img/@src and img/@src != '') or (quote != '')">
              <div class='page-header'>
                <xsl:if test="img/@src and img/@src != ''">
                  <div class='photo' id='photo'> <img class='bubble smallbubble' id="{img/@id}" src='/{img/@src}' alt='{img/@alt}' ></img></div>
                </xsl:if>
                <xsl:if test="quote != ''">
                  <div class="intro" style="display: table; height: 100%; #position: relative; overflow: hidden; ">
                    <div style=" #position: absolute; left:0; #top: 50%;display: table-cell; vertical-align: middle;">
                      <div style=" #position: relative; #top: -50%">
                        <span class="quote" >&#x2026;<xsl:copy-of select="quote/node()" />&#x2026;</span>
                        <br/>
                        <span class="quotee"><xsl:copy-of select="quotee/node()" /></span>
                      </div>
                    </div>
                  </div>
                </xsl:if>
              </div>
            </xsl:if>
            <div class='story'>
              <xsl:copy-of select="story/*" />
                <div class="infinity">&#x221e; <span class="footer-text">Massage &amp; magnetism Practice Balance By Hands in Voorburg</span> &#x221e;</div>
            </div>
          </div>
        </xsl:if>

        <xsl:if test="reactions">
          <xsl:copy-of select="reactions/*" />
        </xsl:if>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
        <script src="/js/jquery.placeholder.min.js"></script>
        <script src="/js/jquery.fancybox-1.3.4.pack.js" type="text/javascript"></script>
        <script type="text/javascript">
          $("input,textarea").placeholder();          
          
          // fade in background image
          var $background = $('.background');
          var img = $background.children("img")[0];

          img.onload = function(){ $background.fadeIn(3000); };
          img.src= "/img/boom.jpg";
          
          // Facebook bar
          var $bar = $(".bar");
          $(".close-button").click(function() { $bar.hide(); });
          setTimeout(function () { $bar.fadeIn(1000); }, 5000);
        
          $(document).ready(function() {
            $("a.fancybox").fancybox({
              'hideOnContentClick': true,
              'transitionOut' : 'fade'
            });
          });

        </script>
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        try {
          var pageTracker = _gat._getTracker("UA-16247626-1");
          pageTracker._trackPageview();
        } catch(err) {}
      </script>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>

