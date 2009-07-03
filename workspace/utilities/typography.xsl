<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="p | ul | ol | li | h1 | h2 | h3 | h4 | h5 | h6 | br | blockquote | a | img | em | strong | code | pre | acronym">
  <xsl:element name="{name(.)}">
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="p | ul | ol | li | h1 | h2 | h3 | h4 | h5 | h6 | br | blockquote | a | img | em | strong | code | pre | acronym" mode="rss">
  <xsl:text disable-output-encoding="yes">&lt;</xsl:text>
  <xsl:value-of select="name(.)"/>
  <xsl:apply-templates select="@*" mode="rss"/>
  <xsl:text disable-output-encoding="yes">&gt;</xsl:text>
  <xsl:apply-templates mode="rss"/>
  <xsl:text disable-output-encoding="yes">&lt;/</xsl:text>
  <xsl:value-of select="name(.)"/>
  <xsl:text disable-output-encoding="yes">&gt;</xsl:text>
</xsl:template>

<xsl:template match="@*" mode="rss">
  <xsl:text> </xsl:text>
  <xsl:value-of select="name(.)"/>
  <xsl:text>="</xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>"</xsl:text>
</xsl:template>

<xsl:template match="@*">
  <xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
</xsl:template>

<xsl:template match="text()">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="abbr">
  <abbr>
    <xsl:attribute name="title">
      <xsl:apply-templates select="/data/terms/term[@abbreviation = current()]"/>
    </xsl:attribute>
    <xsl:value-of select="."/>
  </abbr>
</xsl:template>

<xsl:template match="term">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="img[substring(@src,1,1)='/']">
  <img>
    <xsl:apply-templates select="@*"/>
    <xsl:attribute name="src"><xsl:value-of select="$root"/><xsl:value-of select="@src"/></xsl:attribute>
  </img>
</xsl:template>

<xsl:template match="a[substring(@href,1,1)='/']">
  <a>
    <xsl:apply-templates select="@*"/>
    <xsl:attribute name="href"><xsl:value-of select="$root"/><xsl:value-of select="@href"/></xsl:attribute>
    <xsl:value-of select="."/>
    <xsl:apply-templates select="./*"/>
  </a>
</xsl:template>

</xsl:stylesheet>