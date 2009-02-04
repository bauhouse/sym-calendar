<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="search-and-replace">
  <xsl:param name="input"/>
  <xsl:param name="search-string"/>
  <xsl:param name="replace-string"/>
  <xsl:choose>
    <xsl:when test="$search-string and contains($input,$search-string)">
      <xsl:value-of select="substring-before($input,$search-string)"/>
      <xsl:value-of select="$replace-string"/>
      <xsl:call-template name="search-and-replace">
        <xsl:with-param name="input" select="substring-after($input,$search-string)"/>
        <xsl:with-param name="search-string" select="$search-string"/>
        <xsl:with-param name="replace-string" select="$replace-string"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$input"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>