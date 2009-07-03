<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="navigation-types" match="/data/menus/entry" use="title/@handle"/>
<xsl:key name="sections" match="/data/sections/menu/entry" use="../@link-handle"/>
<xsl:key name="pages" match="/data/pages/section/entry" use="../@link-handle"/>

<xsl:template name="site-navigation">
  <xsl:for-each select="/data/menus/entry">
    <xsl:call-template name="navigation-sections"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="developer-navigation">
  <xsl:param name="navigation-type" select="'developer'"/>
  <xsl:for-each select="key('sections',$navigation-type)">
    <xsl:call-template name="navigation-section-menus"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="symphony-navigation">
  <xsl:param name="navigation-type" select="'symphony'"/>
  <xsl:for-each select="key('sections',$navigation-type)">
    <xsl:call-template name="navigation-section-menus"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="navigation-sections">
  <xsl:param name="navigation-type" select="title/@handle"/>
  <xsl:for-each select="key('sections',$navigation-type)">
    <xsl:call-template name="navigation-section-menus"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="navigation-section-menus">
  <xsl:param name="navigation-type"/>
  <li>
    <xsl:value-of select="title"/>
    <ul>
      <xsl:for-each select="key('pages',title/@handle)">
        <li>
          <a>
            <xsl:call-template name="system-nav-href"/>
            <xsl:value-of select="title"/>
          </a>
        </li>
      </xsl:for-each>
    </ul>
  </li>
</xsl:template>

<xsl:template name="system-nav-href">
  <xsl:choose>
    <xsl:when test="../@link-handle = 'debug' and title = 'XSL'">
      <xsl:attribute name="href"><xsl:value-of select="concat('?debug=',$current-page,'.xsl')"/></xsl:attribute>
    </xsl:when>
    <xsl:when test="../@link-handle = 'debug' or ../@link-handle = 'profile'">
      <xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="substring(url,1,4) = 'http'">
          <xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="href"><xsl:value-of select="$root"/><xsl:value-of select="url"/></xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="user-info">
  <xsl:choose>
    <xsl:when test="$is-logged-in">
      <ul id="usr">
        <li><a href="{$root}/symphony/system/authors/edit/{$user-id}/" title="{$user-type}"><xsl:value-of select="$name"/></a></li>
        <li><a href="{$root}/symphony/logout/">Logout</a></li>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <ul id="usr">
        <li><a href="{$root}/login/">Login</a></li>
      </ul>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>