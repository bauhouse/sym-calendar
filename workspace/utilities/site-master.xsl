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

<!-- ENTRIES OVERVIEW MASTER TEMPLATE -->

<!-- login event information -->
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="name" select="/data/events/login-info/name"/>
<xsl:variable name="username" select="/data/events/login-info/username"/>
<xsl:variable name="user-type" select="/data/events/login-info/@user-type"/>
<xsl:variable name="user-id" select="/data/events/login-info/@id"/>

<!-- URL parameters -->
<xsl:param name="parent" select="$menu"/>
<xsl:param name="self" select="$section"/>
<xsl:param name="child" select="$page"/>

<!-- entries sections and section links -->
<xsl:param name="parent-branch" select="'parent'"/>
<xsl:param name="self-branch" select="'self'"/>
<xsl:param name="child-branch" select="'child'"/>

<xsl:param name="parent-section" select="$entries-sections[@branch = $parent-branch]"/>
<xsl:param name="self-section" select="$entries-sections[@branch = $self-branch]"/>
<xsl:param name="child-section" select="$entries-sections[@branch = $child-branch]"/>

<xsl:param name="parent-section-fields" select="$parent-section/form/label[normalize-space(text()) != 'Deleted']"/>
<xsl:param name="self-section-fields" select="$self-section/form/label[normalize-space(text()) != 'Deleted']"/>
<xsl:param name="child-section-fields" select="$child-section/form/label[normalize-space(text()) != 'Deleted']"/>

<xsl:param name="self-section-link-field" select="substring-before(substring-after($self-section/form/label/select[@class = 'section-link']/@name,'['),']')"/>
<xsl:param name="child-section-link-field" select="substring-before(substring-after($child-section/form/label/select[@class = 'section-link']/@name,'['),']')"/>

<xsl:param name="parent-entry-type" select="$parent-section/type/@lowercase"/>
<xsl:param name="parent-entries-type" select="$parent-section/title/@lowercase"/>
<xsl:param name="parent-entry-type-title" select="$parent-section/type"/>
<xsl:param name="parent-entries-type-title" select="$parent-section/title"/>

<xsl:param name="self-entry-type" select="$self-section/type/@lowercase"/>
<xsl:param name="self-entries-type" select="$self-section/title/@lowercase"/>
<xsl:param name="self-entry-type-title" select="$self-section/type"/>
<xsl:param name="self-entries-type-title" select="$self-section/title"/>

<xsl:param name="child-entry-type" select="$child-section/type/@lowercase"/>
<xsl:param name="child-entries-type" select="$child-section/title/@lowercase"/>
<xsl:param name="child-entry-type-title" select="$child-section/type"/>
<xsl:param name="child-entries-type-title" select="$child-section/title"/>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$website-name"/></title>
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/screen.css" />
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/system.css" />
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/site.css" />
  <!--[if IE]><link rel="stylesheet" href="http://designadmin.com/beta/symphony/assets/legacy.css" type="text/css"><![endif]-->
  </head>
  <body class="site">
    <xsl:call-template name="system-navigation"/>
    <form action="" method="post" enctype="multipart/form-data">
      <xsl:if test="$parent and not($self)">
        <xsl:attribute name="action"><xsl:value-of select="concat($current-root,'/',$parent,'/delete/')"/></xsl:attribute>
      </xsl:if>
      <xsl:call-template name="notice"/>
      <h1><a href="{$root}/"><xsl:value-of select="$website-name"/></a></h1>
      <xsl:apply-templates select="data/navigation"/>
      <xsl:apply-templates/>
      <xsl:call-template name="user-info"/>
    </form>
  </body>
</html>
</xsl:template>
  
<xsl:template match="data">
  <h2>
    <xsl:choose>
      <xsl:when test="$page-heading">
        <a href="{$current-root}/"><xsl:value-of select="$page-heading"/></a>
      </xsl:when>
      <xsl:otherwise>Page Heading</xsl:otherwise>
    </xsl:choose>
  </h2>
  <ul id="entries" class="triple group {$page-type}">
    <li class="{$parent-branch}">
      <xsl:call-template name="list-section-entries">
        <xsl:with-param name="entries-branch" select="$parent-branch"/>
        <xsl:with-param name="entries-root" select="$parent-root"/>
        <xsl:with-param name="entry-type" select="$parent-entry-type"/>
        <xsl:with-param name="entries-type" select="$parent-entries-type"/>
        <xsl:with-param name="entry-type-title" select="$parent-entry-type-title"/>
        <xsl:with-param name="entries-type-title" select="$parent-entries-type-title"/>
        <xsl:with-param name="entries" select="$parent-entries"/>
        <xsl:with-param name="entry-handle-field" select="$parent-entry-handle-field"/>
        <xsl:with-param name="entry-title-field" select="$parent-entry-title-field"/>
        <xsl:with-param name="entry-url-param" select="$parent"/>
      </xsl:call-template>
    </li>
    <li class="{$self-branch}">
      <xsl:call-template name="list-section-entries">
        <xsl:with-param name="entries-branch" select="$self-branch"/>
        <xsl:with-param name="entries-root" select="$self-root"/>
        <xsl:with-param name="entry-type" select="$self-entry-type"/>
        <xsl:with-param name="entries-type" select="$self-entries-type"/>
        <xsl:with-param name="entry-type-title" select="$self-entry-type-title"/>
        <xsl:with-param name="entries-type-title" select="$self-entries-type-title"/>
        <xsl:with-param name="entries" select="$self-entries"/>
        <xsl:with-param name="entry-handle-field" select="$self-entry-handle-field"/>
        <xsl:with-param name="entry-title-field" select="$self-entry-title-field"/>
        <xsl:with-param name="entry-url-param" select="$self"/>
      </xsl:call-template>
    </li>
    <li class="{$child-branch}">
      <xsl:call-template name="list-section-entries">
        <xsl:with-param name="entries-branch" select="$child-branch"/>
        <xsl:with-param name="entries-root" select="$child-root"/>
        <xsl:with-param name="entry-type" select="$child-entry-type"/>
        <xsl:with-param name="entries-type" select="$child-entries-type"/>
        <xsl:with-param name="entry-type-title" select="$child-entry-type-title"/>
        <xsl:with-param name="entries-type-title" select="$child-entries-type-title"/>
        <xsl:with-param name="entries" select="$child-entries"/>
        <xsl:with-param name="entry-handle-field" select="$child-entry-handle-field"/>
        <xsl:with-param name="entry-title-field" select="$child-entry-title-field"/>
        <xsl:with-param name="entry-url-param" select="$child"/>
      </xsl:call-template>
    </li>
  </ul>
</xsl:template>
  
<xsl:template name="list-section-entries">
  <xsl:param name="entries-branch"/>
  <xsl:param name="entries-root"/>
  <xsl:param name="entry-type"/>
  <xsl:param name="entries-type"/>
  <xsl:param name="entry-type-title"/>
  <xsl:param name="entries-type-title"/>
  <xsl:param name="entries"/>
  <xsl:param name="entry-handle-field"/>
  <xsl:param name="entry-title-field"/>
  <xsl:param name="entry-url-param"/>
  <h3>
    <a href="{$entries-root}/"><xsl:value-of select="$entries-type-title"/></a>
    <a href="{$entries-root}/new/" title="Create a new {$entry-type}" class="create button">Create new</a>
  </h3>
  <ul class="entries">
    <xsl:for-each select="$entries">
      <xsl:call-template name="section-entries-list-items">
        <xsl:with-param name="entries-branch" select="$entries-branch"/>
        <xsl:with-param name="entry-url-param" select="$entry-url-param"/>
        <xsl:with-param name="entry-handle-field" select="$entry-handle-field"/>
        <xsl:with-param name="entry-title-field" select="$entry-title-field"/>
      </xsl:call-template>
    </xsl:for-each>
  </ul>
  <xsl:choose>
    <xsl:when test="$entry-url-param and $entries/*[name(.) = $entry-handle-field]/@handle = $entry-url-param">
      <xsl:for-each select="$entries[*[name(.) = $entry-handle-field]/@handle = $entry-url-param][1]">
        <xsl:call-template name="entry-actions">
          <xsl:with-param name="entries-root" select="$entries-root"/>
          <xsl:with-param name="entry-type" select="$entry-type"/>
          <xsl:with-param name="entry-handle-field" select="$entry-handle-field"/>
          <xsl:with-param name="entry-title-field" select="$entry-title-field"/>
          <xsl:with-param name="activated" select="'yes'"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="entry-actions">
        <xsl:with-param name="entry-type" select="$entry-type"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="section-entries-list-items">
  <xsl:param name="entries-branch"/>
  <xsl:param name="entry-url-param"/>
  <xsl:param name="entry-handle-field"/>
  <xsl:param name="entry-title-field"/>
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="*[name(.) = $entry-title-field]"/>
  <li>
    <a href="{$current-root}/{$entry-handle/@handle}/">
      <xsl:if test="$entry-handle/@handle = $entry-url-param">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$entries-branch = 'self'">
          <xsl:attribute name="href">
            <xsl:value-of select="concat($current-root,'/',$parent,'/',$entry-handle/@handle,'/')"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="$entries-branch = 'child'">
          <xsl:attribute name="href">
            <xsl:value-of select="concat($current-root,'/',$parent,'/',$self,'/',$entry-handle/@handle,'/')"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:value-of select="$entry-title"/>
    </a>
  </li>
</xsl:template>

<xsl:template name="entry-actions">
  <xsl:param name="entries-root"/>
  <xsl:param name="entry-type"/>
  <xsl:param name="entry-handle-field"/>
  <xsl:param name="entry-title-field"/>
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="*[name(.) = $entry-title-field]"/>
  <xsl:param name="activated" select="'no'"/>
  <xsl:choose>
    <xsl:when test="$activated = 'yes'">
      <ul class="buttons">
        <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/edit/" title="Edit this {$entry-type}: {$entry-title}" class="edit button">Edit</a></li>
        <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/copy/" title="Copy this {$entry-type}: {$entry-title}" class="copy button">Copy</a></li>
        <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/delete/" title="Delete this {$entry-type}: {$entry-title}" class="delete button">Delete</a></li>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <ul class="buttons disabled">
        <li><a href="#edit" title="Select a {$entry-type} to edit" class="edit button">Edit</a></li>
        <li><a href="#copy" title="Select a {$entry-type} to copy" class="copy button">Copy</a></li>
        <li><a href="#delete" title="Select a {$entry-type} to delete" class="delete button">Delete</a></li>
      </ul>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="notice">
  <xsl:for-each select="/data/events/publish-contact">
    <p id="notice" class="{@result}">
      <xsl:choose>
        <xsl:when test="@result = 'success'"><xsl:value-of select="message"/></xsl:when>
        <xsl:when test="@result = 'error'"><xsl:value-of select="message"/></xsl:when>
        <xsl:otherwise>The system encountered errors when saving your entry. Please check if all the required fields have been filled.</xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:for-each>
  <xsl:for-each select="/data/events/publish-contacts/entry">
    <p id="notice" class="{@result}">
      <xsl:choose>
        <xsl:when test="@result = 'error'"><xsl:value-of select="message"/></xsl:when>
        <xsl:when test="@result = 'success'">Your entries have been saved successfully.</xsl:when>
        <xsl:otherwise>The system encountered errors when saving your entries. Please check if all the required fields have been filled.</xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
