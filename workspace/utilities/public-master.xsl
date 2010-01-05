<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/system-navigation.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:variable name="login-info" select="/data/events/login-info"/>
<xsl:variable name="is-logged-in" select="$login-info/@logged-in"/>
<xsl:variable name="name" select="$login-info/name"/>
<xsl:variable name="username" select="$login-info/username"/>
<xsl:variable name="user-type" select="$login-info/@user-type"/>
<xsl:variable name="user-id" select="$login-info/@id"/>
<xsl:variable name="primary-account" select="$login-info/@primary-account"/>
<xsl:param name="page-types" select="/data/navigation/page[@handle = $current-page]/types"/>
<xsl:param name="page-type">
  <xsl:choose>
    <xsl:when test="$is-logged-in and $page-types/type = 'login'">site</xsl:when>
    <xsl:otherwise>public</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$website-name"/></title>
    <link rel="stylesheet" type="text/css" href="{$root}/symphony/assets/forms.css" />
	<xsl:call-template name="system-nav-css"/>
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/public.css" />
  </head>
  <body class="{$page-type}">
    <xsl:call-template name="system-navigation"/>
    <form action="" method="post">
      <h1><a href="{$root}/"><xsl:value-of select="$website-name"/></a></h1>
      <xsl:apply-templates select="data/navigation"/>
      <xsl:apply-templates/>
      <xsl:call-template name="user-info"/>
    </form>
  </body>
</html>
</xsl:template>
  
</xsl:stylesheet>

