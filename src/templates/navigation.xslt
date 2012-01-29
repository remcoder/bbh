<?xml version="1.0" encoding="UTF-8" ?>
<!--
  untitled
  Created by Remco Veldkamp on 2010-05-06.
  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:common="http://exslt.org/common"
                extension-element-prefixes="common">

  <xsl:param name="lang" value="en" />
  <xsl:variable name="sitemap">
    <sitemap>
      <page id="index" title='Home' />
      <page id="massages" title='Massages' />
      <page id="magnetiseren" title='Magnetiseren' title_en='Magnetize' />
      <page id="op_locatie" title='Massage aan huis' title_en='Massage at home' />
      <page id="bedrijfsstoelmassage" title='Bedrijfsstoelmassage' title_en='Massage at the office' />
      <page id="tarieven" title='Tarieven' title_en="Prices" />
      <page id="wiebenik" title='Wie ben ik?' title_en='Who am I?' />
      <page id="afspraak" title='Afspraak maken' title_en='Make an appointment' />
      <page id="contact-route" title='Contact &amp; Route' title_en='Contact info' />
      <page id="reacties2" title='Reacties' title_en='Feedback' />
    </sitemap>
  </xsl:variable>
  <xsl:template mode="navigation" match="/page" >



    <div class='nav bubble'>
      <ul>
        <xsl:apply-templates mode="navigation" select="common:node-set($sitemap)/sitemap/*" />
        <li>
            <xsl:choose>
              <xsl:when test="$lang = 'en'">
                <a class="lang-switch" href="/{$page_id}.html"><img src="https://www.nwbbank.com/templates/common/images/flag_dutch.gif"/></a>
                <a class="lang-switch" href="/{$page_id}.html">Nederlands</a>
              </xsl:when>
              <xsl:otherwise>
                <a class="lang-switch" href="/en/{$page_id}.html"><img src="http://www.zoneprojects.com/images/flag_english.gif"/></a>
                <a class="lang-switch" href="/en/{$page_id}.html">English</a>
              </xsl:otherwise>
            </xsl:choose>
        </li>
      </ul>
    </div>
  </xsl:template>

  <xsl:template mode="navigation" match="sitemap/page">
    <xsl:variable name="selected" select="@id = $page_id"/>
    <xsl:variable name="page_url">
      <xsl:choose>
        <xsl:when test="@id = 'index'">
          <xsl:text>.</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@id" /><xsl:text>.html</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="title">
      <xsl:choose>
        <xsl:when test="$lang = 'en' and @title_en != ''">
          <xsl:value-of select="@title_en" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@title" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:choose>
        <xsl:when test="$selected">
          <span class="nav-link selected"><xsl:value-of select="$title" /></span>
        </xsl:when>
        <xsl:otherwise>
          <a href="{$page_url}" class="nav-link { $selected }">
            <xsl:value-of select="$title" />
          </a>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>
</xsl:stylesheet>