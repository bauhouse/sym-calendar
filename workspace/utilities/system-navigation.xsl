<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="system-navigation">
  <xsl:param name="system-navigation-switch" select="'on'"/>
  <xsl:if test="$is-logged-in and $system-navigation-switch = 'on'">
    <div id="system-navigation">
      <ul class="menu main-menu">
        <xsl:for-each select="/data/menus/entry">
          <xsl:call-template name="system-nav-sections"/>
        </xsl:for-each>
      </ul>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template name="system-nav-sections">
  <xsl:param name="navigation-type" select="title/@handle"/>
  <xsl:for-each select="key('sections',$navigation-type)">
    <li>
      <a>
        <xsl:call-template name="system-nav-href">
          <xsl:with-param name="navigation-type" select="$navigation-type"/>
        </xsl:call-template>
        <xsl:value-of select="title"/>
      </a>
      <ul>
        <xsl:for-each select="key('pages',title/@handle)">
          <li>
            <a>
              <xsl:call-template name="system-nav-href">
                <xsl:with-param name="navigation-type" select="$navigation-type"/>
              </xsl:call-template>
              <xsl:value-of select="title"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>