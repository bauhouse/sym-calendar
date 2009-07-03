<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/site-master.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<!-- ENTRIES OVERVIEW PAGE CONFIGURATION -->

<!-- configure page -->
<xsl:param name="page-type" select="'contacts'"/>
<xsl:param name="page-heading" select="/data/current-page/entry[section/@link-handle = 'pages']/heading"/>

<!-- configure paths -->
<xsl:param name="current-root" select="concat($root,'/',$current-page)"/>
<xsl:param name="parent-root" select="concat($current-root,'/menus')"/>
<xsl:param name="self-root" select="concat($current-root,'/sections')"/>
<xsl:param name="child-root" select="concat($current-root,'/pages')"/>

<!-- configure entries sections -->
<xsl:param name="entries-sections" select="/data/site-sections/section"/>

<!-- configure parent entries -->
<xsl:param name="parent-entries" select="/data/menus/entry"/>
<xsl:param name="parent-entry-handle-field" select="'title'"/>
<xsl:param name="parent-entry-title-field" select="'title'"/>

<!-- configure self entries -->
<xsl:param name="self-entries" select="/data/sections-by-menu/entry"/>
<xsl:param name="self-entry-handle-field" select="'title'"/>
<xsl:param name="self-entry-title-field" select="'title'"/>

<!-- configure child entries -->
<xsl:param name="child-entries" select="/data/pages-by-section/entry"/>
<xsl:param name="child-entry-handle-field" select="'title'"/>
<xsl:param name="child-entry-title-field" select="'title'"/>

</xsl:stylesheet>

