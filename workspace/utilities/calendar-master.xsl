<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/system-navigation.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>

<xsl:output
  method="xml" 
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8" 
  indent="yes" />

<!-- user info -->
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="name" select="/data/events/login-info/name"/>
<xsl:variable name="username" select="/data/events/login-info/username"/>
<xsl:variable name="user-type" select="/data/events/login-info/@user-type"/>
<xsl:variable name="user-id" select="/data/events/login-info/@id"/>

<!-- configure self page -->
<xsl:param name="parent-page" select="/data/parent-page/entry"/>
<xsl:param name="parent-page-title" select="$parent-page/title"/>
<xsl:param name="parent-page-description" select="$parent-page/description/p"/>

<!-- calendar data -->
<xsl:param name="this-date" select="'2008-02-14'"/>
<xsl:param name="this-year" select="substring($this-date,1,4)"/>
<xsl:param name="this-month" select="substring($this-date,6,2)"/>
<xsl:param name="this-month-int">
  <xsl:choose>
    <xsl:when test="substring($this-month, 1, 1) = 0"><xsl:value-of select="substring($this-month, 2, 1)"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="$this-month"/></xsl:otherwise>
  </xsl:choose>
</xsl:param>
<xsl:param name="this-day" select="substring($this-date, 9, 2)"/>
<xsl:param name="first-day-of-the-month" select="concat($this-year,'-',$this-month,'-01')"/>
<xsl:param name="leap-year">
  <xsl:call-template name="is-leap-year">
    <xsl:with-param name="year" select="$this-year"/>
  </xsl:call-template>
</xsl:param>
<xsl:variable name="a" select="floor((14 - $this-month) div 12)"/>
<xsl:variable name="y" select="$this-year - $a"/>
<xsl:variable name="m" select="$this-month + 12 * $a - 2"/>
<xsl:param name="first-day">
  <xsl:call-template name="calculate-day-of-the-week">
    <xsl:with-param name="date" select="$first-day-of-the-month"/>
  </xsl:call-template>
</xsl:param>
<xsl:param name="total-days">
  <xsl:call-template name="total-days">
    <xsl:with-param name="leap-year" select="$leap-year"/>
  </xsl:call-template>
</xsl:param>
<xsl:param name="start" select="$first-day"/>
<xsl:param name="count" select="$total-days"/>
<xsl:param name="total" select="$start + $count - 1"/>
<xsl:param name="overflow" select="$total mod 7"/>
<xsl:param name="nelements">
  <xsl:choose>
    <xsl:when test="$overflow > 0"><xsl:value-of select="$total + 7 - $overflow"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="$total"/></xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="page-type" select="'calendar'"/>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$website-name"/></title>
    <!-- link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/screen.css" / -->
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/system.css" />
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/site.css" />
    <!--[if IE]><link rel="stylesheet" href="http://designadmin.com/beta/symphony/assets/legacy.css" type="text/css"><![endif]-->
    <style>
      <xsl:attribute name="type">text/css</xsl:attribute>
      <xsl:value-of select="concat('@import url(',$root,'/symphony/assets/basic.css);')"/>
      <xsl:value-of select="concat('@import url(',$root,'/symphony/assets/admin.css);')"/>
      <xsl:value-of select="concat('@import url(',$root,'/symphony/assets/code.css);')"/>
      <xsl:value-of select="concat('@import url(',$workspace,'/assets/css/calendar.css);')"/>
    </style>
  </head>
  <body class="site">
    <form action="" method="post">
      <xsl:call-template name="system-navigation"/>
      <h1 id="top"><a href="{$root}/"><xsl:value-of select="$website-name"/></a></h1>
      <xsl:apply-templates select="data/navigation"/>
      <xsl:apply-templates/>
      <xsl:call-template name="user-info"/>
    </form>
  </body>
</html>
</xsl:template>

<xsl:template name="total-days">
  <xsl:param name="leap-year"/>
  <xsl:choose>
    <xsl:when test="$this-month-int!='2'">
      <xsl:value-of select="/data/calendar/year/month[@value=$this-month-int]/@days"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$leap-year=1">
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@leap-year-days"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="/data/calendar/year/month[@value=2]/@days"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>