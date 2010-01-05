<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/system-master.xsl"/>

<xsl:template match="data">
  <xsl:for-each select="current-page/entry">
    <h2><xsl:value-of select="heading"/></h2>
    <fieldset class="settings">
      <legend>Description</legend>
      <xsl:copy-of select="description/*"/>
    </fieldset>
    <xsl:if test="body/*">
      <fieldset class="settings">
        <legend>Body</legend>
        <xsl:copy-of select="body/*"/>
      </fieldset>
    </xsl:if>
  </xsl:for-each>
  <div class="actions">
  </div>
</xsl:template>
  
</xsl:stylesheet>

