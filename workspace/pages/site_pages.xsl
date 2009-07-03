<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- global configuration settings in the master -->
<xsl:import href="../utilities/site-entries-master.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<!-- configure branches -->
<xsl:param name="this-branch" select="'child'"/>
<xsl:param name="next-branch"/>

<!-- configure section link terms -->
<xsl:param name="section-parent" select="'sections'"/>
<xsl:param name="section-parent-title" select="'Sections'"/>

<!-- configure entries root -->
<xsl:param name="entries-root" select="$current-root"/>

<!-- configure entries -->
<xsl:param name="entries" select="$pages"/>
<xsl:param name="entry-details" select="$page-details"/>
<xsl:param name="entry-handle-field" select="'title'"/>
<xsl:param name="entry-title-field" select="'title'"/>

<!-- configure section link entries -->
<xsl:param name="section-link-entries" select="$sections"/>
<xsl:param name="section-link-details" select="$section-details"/>
<xsl:param name="section-link-handle-field" select="'title'"/>
<xsl:param name="section-link-title-field" select="'title'"/>

<!-- configure section link child entries -->
<xsl:param name="section-link-child-handle-field" select="'None'"/>
<xsl:param name="section-link-child-title-field" select="'None'"/>

<!-- configure entries fields and events -->
<xsl:param name="entry-event" select="'publish-page'"/>
<xsl:param name="event-result" select="/data/events/publish-page"/>
<xsl:param name="entries-event" select="'publish-pages'"/>
<xsl:param name="event-results" select="/data/events/publish-pages"/>

</xsl:stylesheet>

