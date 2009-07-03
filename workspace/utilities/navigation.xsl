<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/site-navigation.xsl"/>

<xsl:template match="navigation">
  <ul id="nav">
    <xsl:choose>
      <xsl:when test="$page-type = 'system'">
        <xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'login')  and not(@handle = 'system')]" mode="front-end"/>
        <xsl:call-template name="symphony-navigation"/>
      </xsl:when>
      <xsl:when test="$is-logged-in">
        <xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'login')]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="page[not(types/type = 'hidden') and not(types/type = 'admin')]"/>
      </xsl:otherwise>
    </xsl:choose>
  </ul>
</xsl:template>

<xsl:template match="page">
  <li>
    <a href="{$root}/{@handle}/">
      <xsl:if test="@handle = $current-page or 
        (@handle = $current-page and $page-type = $current-page) or 
        (@handle = $parent-path and $page-type = $parent-path)">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="name"/>
    </a>
  </li>
</xsl:template>

<xsl:template match="page" mode="front-end">
  <li class="front-end">
    <a href="{$root}/{@handle}/">
      <xsl:if test="@handle = $current-page">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="name"/>
    </a>
  </li>
</xsl:template>

</xsl:stylesheet>