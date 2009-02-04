<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- http://www.entropy.ch/software/xsl/xml-prettyprinter.xslt -->

<xsl:variable name="indent_text" select="'  '"/>

<xsl:template match="*[count(*) = 0]" mode="xml-prettyprinter">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:element name="{name()}"><xsl:copy-of select="@*"/><xsl:value-of select="normalize-space(.)"/></xsl:element><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="*[count(*) > 0]" mode="xml-prettyprinter">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:element name="{name()}"><xsl:copy-of select="@*"/><xsl:text>
</xsl:text>
<xsl:apply-templates><xsl:with-param name="indent" select="$indent + 1"/></xsl:apply-templates>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template></xsl:element><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template name="indent">
<xsl:param name="count"/>
<xsl:if test="$count > 0">
<xsl:copy-of select="$indent_text"/>
<xsl:call-template name="indent">
<xsl:with-param name="count" select="$count - 1"/>
</xsl:call-template>
</xsl:if>
</xsl:template>

<xsl:template match="text()[string-length(normalize-space(.)) &lt; 1]" mode="xml-prettyprinter">
</xsl:template>

<xsl:template match="text()[string-length(normalize-space(.)) > 1]" mode="xml-prettyprinter">
<xsl:param name="indent" select="0"/>
<xsl:call-template name="indent"><xsl:with-param name="count" select="$indent"/></xsl:call-template>
<xsl:value-of select="normalize-space(.)"/><xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>