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


<!-- CONFIGURE ENTRIES MASTER -->

<!-- configure page type -->
<xsl:param name="page-type" select="'site'"/>

<!-- configure page handles -->
<xsl:param name="parent-page-handle" select="'menus'"/>
<xsl:param name="self-page-handle" select="'sections'"/>
<xsl:param name="child-page-handle" select="'pages'"/>

<!-- configure section fields data source -->
<xsl:param name="entries-sections" select="/data/site-sections/section"/>

<!-- configure global data sources -->
<xsl:param name="menus" select="/data/menus/entry"/>
<xsl:param name="menu-details" select="/data/menu-details/entry"/>
<xsl:param name="sections" select="/data/sections/menu/entry"/>
<xsl:param name="section-details" select="/data/section-details/entry"/>
<xsl:param name="pages" select="/data/pages/section/entry"/>
<xsl:param name="page-details" select="/data/page-details/entry"/>

<!-- configure self page -->
<xsl:param name="parent-page" select="/data/parent-page/entry"/>
<xsl:param name="parent-page-title" select="$parent-page/title"/>
<xsl:param name="parent-page-description" select="$parent-page/description/p"/>

<!-- configure entry keys -->
<xsl:key name="menus" match="/data/menus/entry" use="@id"/>
<xsl:key name="sections" match="/data/sections/menu/entry" use="../@link-id"/>
<xsl:key name="pages" match="/data/pages/section/entry" use="../@link-id"/>


<!-- NO CONFIGURATION REQUIRED AFTER THIS POINT -->

<!-- login event information -->
<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="name" select="/data/events/login-info/name"/>
<xsl:variable name="username" select="/data/events/login-info/username"/>
<xsl:variable name="user-type" select="/data/events/login-info/@user-type"/>
<xsl:variable name="user-id" select="/data/events/login-info/@id"/>

<!-- paths -->
<xsl:param name="current-root" select="concat($root,$parent-path,'/',$current-page)"/>
<xsl:param name="parent-page-root" select="concat($root,$parent-path)"/>
<xsl:param name="parent-root" select="concat($parent-page-root,'/',$parent-page-handle)"/>
<xsl:param name="self-root" select="concat($parent-page-root,'/',$self-page-handle)"/>
<xsl:param name="child-root" select="concat($parent-page-root,'/',$child-page-handle)"/>

<!-- entries sections and section links -->
<xsl:param name="this-section" select="$entries-sections[@branch = $this-branch]"/>
<xsl:param name="child-section" select="$entries-sections[@branch = $next-branch]"/>

<xsl:param name="section-fields" select="$this-section/form/label[normalize-space(text()) != 'Deleted']"/>
<xsl:param name="section-link-field" select="substring-before(substring-after($this-section/form/label/select[@class = 'section-link']/@name,'['),']')"/>

<xsl:param name="entry-type" select="$this-section/type/@lowercase"/>
<xsl:param name="entries-type" select="$this-section/title/@lowercase"/>
<xsl:param name="entry-type-title" select="$this-section/type"/>
<xsl:param name="entries-type-title" select="$this-section/title"/>

<xsl:param name="section-child" select="$child-section/type/@lowercase"/>
<xsl:param name="section-children" select="$child-section/title/@lowercase"/>
<xsl:param name="section-child-title" select="$child-section/type"/>
<xsl:param name="section-children-title" select="$child-section/title"/>

<!-- section fields parameters -->
<xsl:param name="show-columns" select="$section-fields[@class = 'show']"/>
<xsl:param name="count-show-columns" select="count($show-columns)"/>

<!-- actions and results parameters -->
<xsl:param name="result" select="/data/events//@result"/>
<xsl:param name="deleted">
  <xsl:if test="$action = 'delete'">
    <xsl:choose>
      <xsl:when test="$result = 'success'">yes</xsl:when>
      <xsl:otherwise>no</xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:param>
<xsl:param name="current-action-title">
  <xsl:choose>
    <xsl:when test="$entry = 'new' or $deleted = 'yes'">Create</xsl:when>
    <xsl:when test="$entry = 'edit' or $entry = 'sort' or $action = 'edit'">Edit</xsl:when>
    <xsl:when test="$entry = 'delete' or $action = 'delete'">Delete</xsl:when>
    <xsl:when test="$action = 'copy'">Copy</xsl:when>
    <xsl:when test="not($action)">Preview</xsl:when>
  </xsl:choose>
</xsl:param>
<xsl:param name="current-action" select="translate($current-action-title,'CDEP','cdep')"/>
<xsl:param name="edit-active">
  <xsl:if test="$current-action = 'edit'"><xsl:text> active</xsl:text></xsl:if>
</xsl:param>
<xsl:param name="copy-active">
  <xsl:if test="$current-action = 'copy'"><xsl:text> active</xsl:text></xsl:if>
</xsl:param>
<xsl:param name="preview-active">
  <xsl:if test="$current-action = 'preview'"><xsl:text> active</xsl:text></xsl:if>
</xsl:param>
<xsl:param name="delete-active">
  <xsl:if test="$current-action = 'delete'"><xsl:text> active</xsl:text></xsl:if>
</xsl:param>
<xsl:param name="create-active">
  <xsl:if test="$current-action = 'create'"><xsl:text> active</xsl:text></xsl:if>
</xsl:param>

<!-- sort parameters -->
<xsl:param name="sort-field">
  <xsl:if test="$entry = 'sort'"><xsl:value-of select="$id"/></xsl:if>
</xsl:param>
<xsl:param name="sort-order">
  <xsl:if test="$entry = 'sort'">
    <xsl:choose>
      <xsl:when test="$action"><xsl:value-of select="$action"/></xsl:when>
      <xsl:otherwise>ascending</xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:param>
<xsl:param name="sort-switch">
  <xsl:choose>
    <xsl:when test="$sort-order = 'descending'">ascending</xsl:when>
    <xsl:when test="$sort-order = 'ascending'">descending</xsl:when>
  </xsl:choose>
</xsl:param>

<!-- content type -->
<xsl:param name="content-type">
  <xsl:choose>
    <xsl:when test="not($entry) or $entry = 'edit' or $entry = 'delete' or $entry = 'sort'">tables</xsl:when>
    <xsl:otherwise>form</xsl:otherwise>
  </xsl:choose>
</xsl:param>


<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="$website-name"/></title>
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/screen.css" />
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/system.css" />
    <link rel="stylesheet" type="text/css" href="{$workspace}/assets/css/site.css" />
    <xsl:if test="$content-type = 'tables'">
      <style>
        <xsl:attribute name="type">text/css</xsl:attribute>
        <xsl:text>@import url("</xsl:text>
        <xsl:value-of select="concat($root,'/symphony/assets/tables.css')"/>
        <xsl:text>");</xsl:text>
      </style>
    </xsl:if>
  <!--[if IE]><link rel="stylesheet" href="http://designadmin.com/beta/symphony/assets/legacy.css" type="text/css"><![endif]-->
  </head>
  <body class="site {$content-type}">
    <xsl:call-template name="system-navigation"/>
    <form action="" method="post" enctype="multipart/form-data">
      <xsl:if test="not($entry) or $entry = 'sort'">
        <xsl:attribute name="action"><xsl:value-of select="concat($current-root,'/edit/')"/></xsl:attribute>
      </xsl:if>
      <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
      <xsl:call-template name="notice"/>
      <xsl:call-template name="confirm-delete"/>
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
    <xsl:call-template name="entry-page-heading"/>
  </h2>
  <xsl:choose>
    <xsl:when test="$action">
      <xsl:choose>
        <xsl:when test="$entry = 'sort'">
          <xsl:call-template name="entries-list"/>
        </xsl:when>
        <xsl:when test="$deleted = 'yes'">
          <xsl:call-template name="publish-entry"/>
        </xsl:when>
        <xsl:when test="$action = 'edit' or $action = 'copy' or $action = 'delete'">
          <xsl:for-each select="$entry-details">
            <xsl:call-template name="publish-entry"/>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$entry">
      <xsl:choose>
        <xsl:when test="$entry = 'new'">
          <xsl:call-template name="publish-entry"/>
        </xsl:when>
        <xsl:when test="$entry = 'edit' or $entry = 'delete'">
          <xsl:call-template name="entries-list"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="$entry-details">
            <xsl:call-template name="entry-details"/>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="entries-list"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
  
<xsl:template name="entry-page-heading">
  <xsl:param name="entry-handle" select="$entry-details/*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="$entry-details/*[name(.) = $entry-title-field]"/>
  <a href="{$parent-page-root}/" title="{$parent-page-description}">
    <xsl:value-of select="$parent-page-title"/>
  </a> : 
  <a href="{$entries-root}/" title="List {$entries-type}">
    <xsl:value-of select="$entries-type-title"/>
  </a>
  <xsl:choose>
    <xsl:when test="$deleted = 'yes'">
      <xsl:text> : Deleted : Create New</xsl:text>
    </xsl:when>
    <xsl:when test="$entry and $entry != 'new' and $entry != 'delete' and $entry != 'edit' and $entry != 'sort'">
      <xsl:text> : </xsl:text>
      <a href="{$entries-root}/{$entry}/{$entry-details/@id}/" title="Preview Entry: {$entry-title}"><xsl:value-of select="$entry-title"/></a>
      <a href="{$entries-root}/new/" title="Create a new {$entry-type}" class="create button">Create New</a>
    </xsl:when>
    <xsl:when test="$entry = 'new'">
      <a href="{$entries-root}/new/" title="Create a new {$entry-type}" class="create button active">Create New</a>
    </xsl:when>
  </xsl:choose>
  <a href="{$current-root}/new/" title="Create a new entry" class="create button{$create-active}">Create New</a>
</xsl:template>

<xsl:template name="list-entries">
  <div class="secondary list {$this-branch}" id="entries">
    <h3>
      <a href="{$entries-root}/" title="List {$entries-type}">
        <xsl:value-of select="$entries-type-title"/>
      </a>
      <xsl:if test="$current-action-title">
        <xsl:text> : </xsl:text>
        <xsl:value-of select="$current-action-title"/>
      </xsl:if>
    </h3>
    <xsl:for-each select="$entries[@id = $id]">
      <xsl:call-template name="entry-actions">
        <xsl:with-param name="activated" select="'yes'"/>
      </xsl:call-template>
    </xsl:for-each>
    <ul class="entries">
      <xsl:choose>
        <xsl:when test="$entries/*">
          <xsl:for-each select="$entries">
            <xsl:call-template name="entries-list-items"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <li class="inactive"><a href="{$entries-root}/new/" title="Create a new entry">No entries available.</a></li>
        </xsl:otherwise>
      </xsl:choose>
    </ul>
  </div>
</xsl:template>

<xsl:template name="entry-actions">
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="*[name(.) = $entry-title-field]"/>
  <xsl:param name="activated" select="'no'"/>
  <ul class="buttons">
    <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/edit/" title="Edit this {$entry-type}: {$entry-title}" class="edit button{$edit-active}">Edit</a></li>
    <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/copy/" title="Copy this {$entry-type}: {$entry-title}" class="copy button{$copy-active}">Copy</a></li>
    <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/" title="Preview this {$entry-type}: {$entry-title}" class="preview button{$preview-active}">Preview</a></li>
    <li><a href="{$entries-root}/{$entry-handle/@handle}/{@id}/delete/" title="Delete this {$entry-type}: {$entry-title}" class="delete button{$delete-active}">Delete</a></li>
  </ul>
</xsl:template>

<xsl:template name="entries-list-items">
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="*[name(.) = $entry-title-field]"/>
  <xsl:param name="selected-action">
    <xsl:choose>
      <xsl:when test="$action and $action != 'delete'">
        <xsl:value-of select="concat($action,'/')"/>
      </xsl:when>
      <xsl:when test="$action = 'delete' or $entry = 'new'">
        <xsl:value-of select="'edit/'"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <li>
    <a href="{$entries-root}/{$entry-handle/@handle}/{@id}/{$selected-action}" title="{$current-action-title} this {$entry-type}: {$entry-title}">
      <xsl:if test="@id = $id">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$entry-title"/>
    </a>
  </li>
</xsl:template>

<xsl:template name="entry-details">
  <div class="primary preview">
    <h3>Preview</h3>
    <xsl:for-each select="$section-fields">
      <xsl:call-template name="entry-fields-details"/>
    </xsl:for-each>
  </div>
  <xsl:call-template name="list-entries"/>
  <xsl:call-template name="submit-entry-actions"/>
</xsl:template>

<xsl:template name="entry-fields-details">
  <xsl:param name="field-title" select="normalize-space(text())"/>
  <xsl:param name="field-handle" select="substring-before(substring-after(*/@name,'['),']')"/>
  <xsl:param name="field-type">
    <xsl:choose>
      <xsl:when test="input">
        <xsl:value-of select="input/@type"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="name(*)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="field-value" select="$entry-details/*[name(.) = $field-handle]"/>
  <xsl:param name="is-section-link-field">
    <xsl:if test="@class = 'section-link'">yes</xsl:if>
  </xsl:param>
  <xsl:param name="section-link-entry" select="$section-link-entries[@id = $entry-details/*[name(.) = $field-handle]/@link-id]"/>
  <xsl:param name="section-link-field-value" select="$section-link-entry/*[name(.) = $section-link-title-field]"/>
  <xsl:param name="section-link-parent-handle" select="$section-link-entry/../@link-handle"/>
  <xsl:param name="section-link-handle" select="$section-link-entry/*[name(.) = $section-link-handle-field]/@handle"/>
  <xsl:param name="website-url">
    <xsl:if test="$field-handle = 'website'">
      <xsl:value-of select="substring-before(substring-after($field-value,'http://'),'/')"/>
    </xsl:if>
  </xsl:param>
  <xsl:choose>
    <xsl:when test="$field-type = 'text'">
      <xsl:if test="$field-value">
        <div class="field">
          <h3><xsl:value-of select="$field-title"/></h3>
          <div class="text">
            <p>
              <xsl:choose>
                <xsl:when test="$field-handle = 'website'">
                  <a href="{$field-value}" title="View site: {$website-url}">
                    <xsl:value-of select="$website-url"/>
                  </a>
                </xsl:when>
                <xsl:when test="$field-handle = 'email'">
                  <a href="mailto:{$field-value}" title="Send email to {$field-value}">
                    <xsl:value-of select="$field-value"/>
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$field-value"/>
                </xsl:otherwise>
              </xsl:choose>
            </p>
          </div>
        </div>
      </xsl:if>
    </xsl:when>
    <xsl:when test="$field-type = 'textarea'">
      <div class="field">
        <h3><xsl:value-of select="$field-title"/></h3>
        <div class="text">
          <xsl:choose>
            <xsl:when test="$field-value/*">
              <xsl:copy-of select="$field-value/*"/>
            </xsl:when>
            <xsl:otherwise>
              <p class="inactive">None</p>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </div>
    </xsl:when>
    <xsl:when test="$field-type = 'select'">
      <xsl:if test="$field-value">
        <div class="field">
          <h3><xsl:value-of select="$field-title"/></h3>
          <div class="text">
            <p>
              <xsl:choose>
                <xsl:when test="$is-section-link-field">
                  <a href="{$parent-page-root}/{$section-link-handle}/" title="View {$entries-type} by {$field-title}: {$section-link-field-value}">
                    <xsl:if test="$this-branch = 'child'">
                      <xsl:attribute name="href">
                        <xsl:value-of select="concat($parent-page-root,'/',$section-link-parent-handle,'/',$section-link-handle,'/')"/>
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="$section-link-field-value"/>
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$field-value"/>
                </xsl:otherwise>
              </xsl:choose>
            </p>
          </div>
        </div>
      </xsl:if>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="publish-entry">
  <fieldset class="primary">
    <xsl:for-each select="$section-fields">
      <xsl:call-template name="publish-entry-fields"/>
    </xsl:for-each>
  </fieldset>
  <xsl:call-template name="list-entries"/>
  <xsl:call-template name="submit-entry-actions"/>
</xsl:template>

<xsl:template name="publish-entry-fields">
  <xsl:param name="field-title" select="normalize-space(text())"/>
  <xsl:param name="field-handle" select="substring-before(substring-after(*/@name,'['),']')"/>
  <xsl:param name="field-type">
    <xsl:choose>
      <xsl:when test="input">
        <xsl:value-of select="input/@type"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="name(*)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="field-value" select="$entry-details/*[name(.) = $field-handle]"/>
  <xsl:choose>
    <xsl:when test="$field-type = 'text'">
      <label><xsl:value-of select="$field-title"/>
        <input name="fields[{$field-handle}]" type="text" value="{$field-value}"/>
      </label>
    </xsl:when>
    <xsl:when test="$field-type = 'textarea'">
      <label><xsl:value-of select="$field-title"/>
        <xsl:for-each select="textarea">
          <textarea name="fields[{$field-handle}]" rows="{@rows}" cols="{@cols}">
            <xsl:apply-templates select="$field-value" mode="markdown"/>
          </textarea>
        </xsl:for-each>
      </label>
    </xsl:when>
    <xsl:when test="$field-type = 'select'">
      <label><xsl:value-of select="$field-title"/>
        <select name="fields[{$field-handle}]">
          <xsl:for-each select="$section-link-entries">
            <xsl:call-template name="section-link-entries-select-options"/>
          </xsl:for-each>
        </select>
      </label>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="section-link-entries-select-options">
  <xsl:param name="section-link-id" select="$entry-details//@link-id"/>
  <xsl:param name="section-link-entry" select="$section-link-entries[@id = $section-link-id]"/>
  <xsl:param name="field-handle"/>
  <option value="{@id}">
    <xsl:if test="@id = $section-link-id">
      <xsl:attribute name="selected">selected</xsl:attribute>
    </xsl:if>
    <xsl:value-of select="*[name(.) = $section-link-title-field]"/>
  </option>
</xsl:template>

<xsl:template name="entries-list">
  <table class="{$current-action}">
    <colgroup>
      <xsl:for-each select="$show-columns">
        <xsl:call-template name="entries-table-columns"/>
      </xsl:for-each>
      <xsl:choose>
        <xsl:when test="$entry = 'delete'">
          <col class="delete"/>
        </xsl:when>
        <xsl:otherwise>
          <col class="{$section-child}"/>
        </xsl:otherwise>
      </xsl:choose>
    </colgroup>
    <thead>
      <tr>
        <xsl:for-each select="$show-columns">
          <xsl:call-template name="entries-table-head"/>
        </xsl:for-each>
        <xsl:choose>
          <xsl:when test="$entry = 'delete'">
            <th>Delete</th>
          </xsl:when>
          <xsl:when test="$entry = 'edit' or not($next-branch)"></xsl:when>
          <xsl:otherwise>
            <th><xsl:value-of select="$section-children-title"/></th>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
    </thead>
    <tbody>
      <xsl:choose>
        <xsl:when test="$entry = 'sort' and $sort-field = 'sort'">
          <xsl:for-each select="$entries">
            <xsl:sort select="*[name(.) = $sort-field]" order="{$sort-order}" data-type="number"/>
            <xsl:call-template name="entries-table-rows">
              <xsl:with-param name="section-link-id" select="../@link-id"/>
              <xsl:with-param name="entry-id" select="@id"/>
              <xsl:with-param name="index" select="position() - 1"/>
              <xsl:with-param name="odd-row" select="position() mod 2"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$entry = 'sort' and $sort-field = $section-link-field">
          <xsl:for-each select="$entries">
            <xsl:sort select="../@link-handle" order="{$sort-order}"/>
            <xsl:call-template name="entries-table-rows">
              <xsl:with-param name="section-link-id" select="../@link-id"/>
              <xsl:with-param name="entry-id" select="@id"/>
              <xsl:with-param name="index" select="position() - 1"/>
              <xsl:with-param name="odd-row" select="position() mod 2"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$entry = 'sort'">
          <xsl:for-each select="$entries">
            <xsl:sort select="*[name(.) = $sort-field]" order="{$sort-order}"/>
            <xsl:call-template name="entries-table-rows">
              <xsl:with-param name="section-link-id" select="../@link-id"/>
              <xsl:with-param name="entry-id" select="@id"/>
              <xsl:with-param name="index" select="position() - 1"/>
              <xsl:with-param name="odd-row" select="position() mod 2"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$entries/*">
          <xsl:for-each select="$entries">
            <xsl:call-template name="entries-table-rows">
              <xsl:with-param name="section-link-id" select="../@link-id"/>
              <xsl:with-param name="entry-id" select="@id"/>
              <xsl:with-param name="index" select="position() - 1"/>
              <xsl:with-param name="odd-row" select="position() mod 2"/>
            </xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <tr class="odd inactive">
            <td colspan="{$count-show-columns + 1}">No entries available.
              <a href="{$entries-root}/new/">Create a new 
                <xsl:value-of select="$entry-type"/>
              </a>
            </td>
          </tr>
        </xsl:otherwise>
      </xsl:choose>
    </tbody>
  </table>
  <xsl:call-template name="entries-list-actions"/>
</xsl:template>

<xsl:template name="entries-table-columns">
  <xsl:param name="field-handle" select="substring-before(substring-after(*/@name,'['),']')"/>
  <xsl:param name="field-type">
    <xsl:choose>
      <xsl:when test="input">
        <xsl:value-of select="input/@type"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="name(*)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <col class="{$field-handle} {$field-type}-field"/>
</xsl:template>

<xsl:template name="entries-table-head">
  <xsl:param name="field-handle" select="substring-before(substring-after(*/@name,'['),']')"/>
  <xsl:param name="field-title" select="normalize-space(text())"/>
  <th>
    <xsl:choose>
      <xsl:when test="input or select">
        <a href="{$entries-root}/sort/{$field-handle}/ascending/" title="Sort by ascending {$field-title}">
          <xsl:if test="$sort-field = $field-handle">
            <xsl:attribute name="class">active</xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="concat($entries-root,'/sort/',$field-handle,'/',$sort-switch,'/')"/>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="concat('Sort by ',$sort-switch,' ',$field-title)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="$field-title"/>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$field-title"/>
      </xsl:otherwise>
    </xsl:choose>
  </th>
</xsl:template>

<xsl:template name="entries-table-rows">
  <xsl:param name="entry-id"/>
  <xsl:param name="section-link-id"/>
  <xsl:param name="section-link-entry" select="$section-link-entries[@id = $section-link-id]"/>
  <xsl:param name="parent-link-id" select="$section-link-entry/../@link-id"/>
  <xsl:param name="parent-link-handle" select="$section-link-entry/../@link-handle"/>
  <xsl:param name="index"/>
  <xsl:param name="odd-row"/>
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:param name="entry-title" select="*[name(.) = $entry-title-field]"/>
  <xsl:param name="section-link-child-handle" select="*[name(.) = $section-link-child-handle-field]/@link-handle"/>
  <xsl:param name="count-section-link-children" select="@*[name(.) = $section-children]"/>
  <xsl:param name="count-section-link-children-not-deleted" select="count(key($section-children,@id))"/>
  <xsl:param name="parent-handle">
    <xsl:choose>
      <xsl:when test="$this-branch = 'self'">
        <xsl:value-of select="../@link-handle"/>
      </xsl:when>
      <xsl:when test="$this-branch = 'child'">
        <xsl:value-of select="$parent-link-handle"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="self-handle">
    <xsl:choose>
      <xsl:when test="$this-branch = 'self'">
        <xsl:value-of select="$entry-handle/@handle"/>
      </xsl:when>
      <xsl:when test="$this-branch = 'child'">
        <xsl:value-of select="../@link-handle"/>
      </xsl:when>
    </xsl:choose>
  </xsl:param>
  <tr>
    <xsl:if test="$odd-row = '1'">
      <xsl:attribute name="class">odd</xsl:attribute>
    </xsl:if>
    <xsl:for-each select="$show-columns">
      <xsl:call-template name="entries-table-data">
        <xsl:with-param name="parent-handle" select="$parent-handle"/>
        <xsl:with-param name="self-handle" select="$self-handle"/>
        <xsl:with-param name="section-link-id" select="$section-link-id"/>
        <xsl:with-param name="entry-id" select="$entry-id"/>
        <xsl:with-param name="index" select="$index"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:choose>
      <xsl:when test="$entry = 'delete'">
        <td>
          <input type="checkbox" name="fields[{$index}][deleted]"/>
          <input name="id[{$index}]" type="hidden" value="{@id}" />
        </td>
      </xsl:when>
      <xsl:when test="$entry = 'edit' or not($next-branch)"></xsl:when>
      <xsl:otherwise>
        <td>
          <xsl:choose>
            <xsl:when test="$count-section-link-children-not-deleted = 0">
              <xsl:attribute name="class">inactive</xsl:attribute>
              None
            </xsl:when>
            <xsl:otherwise>
              <a href="{$parent-page-root}/{$entry-handle/@handle}/" title="View {$section-children} of this {$entry-type}: {$entry-title}">
                <xsl:if test="$this-branch = 'self'">
                  <xsl:attribute name="href">
                    <xsl:value-of select="concat($parent-page-root,'/',$parent-handle,'/',$entry-handle/@handle,'/')"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="$count-section-link-children-not-deleted"/>
                <xsl:text> </xsl:text>
                <xsl:choose>
                  <xsl:when test="$count-section-link-children-not-deleted = 1">
                    <xsl:value-of select="$section-child-title"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$section-children-title"/>
                  </xsl:otherwise>
                </xsl:choose>
              </a>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </tr>
</xsl:template>

<xsl:template name="link-to-counted-section-link-children">
  <a href="{$parent-page-root}/{$entry-handle/@handle}/" title="View {$section-children} of this {$entry-type}: {$entry-title}">
    <xsl:if test="$this-branch = 'self'">
      <xsl:attribute name="href">
        <xsl:value-of select="concat($parent-page-root,'/',$parent-handle,'/',$entry-handle/@handle,'/')"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:value-of select="$count-section-link-children-not-deleted"/>
    <xsl:text> </xsl:text>
  </a>
</xsl:template>

<xsl:template name="entries-table-data">
  <xsl:param name="field-title" select="normalize-space(text())"/>
  <xsl:param name="field-handle" select="substring-before(substring-after(*/@name,'['),']')"/>
  <xsl:param name="field-type">
    <xsl:choose>
      <xsl:when test="input">
        <xsl:value-of select="input/@type"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="name(*)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:param name="parent-handle"/>
  <xsl:param name="self-handle"/>
  <xsl:param name="section-link-id"/>
  <xsl:param name="section-link-entry" select="$section-link-entries[@id = $section-link-id]"/>
  <xsl:param name="section-link-title" select="$section-link-entry/*[name(.) = $section-link-title-field]"/>
  <xsl:param name="section-link-handle" select="$section-link-entry/*[name(.) = $section-link-handle-field]"/>
  <xsl:param name="entry-id"/>
  <xsl:param name="this-entry" select="$entries[@id = $entry-id]"/>
  <xsl:param name="this-entry-title" select="$this-entry/*[name(.) = $entry-title-field]"/>
  <xsl:param name="website-url" select="$this-entry/website"/>
  <xsl:param name="email" select="$this-entry/email"/>
  <xsl:param name="field-value" select="$this-entry/*[name(.) = $field-handle]"/>
  <xsl:param name="index"/>
  <xsl:choose>
    <xsl:when test="$field-type = 'text'">
      <td>
        <xsl:choose>
          <xsl:when test="$field-value">
            <xsl:if test="$entry = 'edit' or $entry = 'delete'">
              <input name="id[{$index}]" type="hidden" value="{$entry-id}" />
            </xsl:if>
            <input type="hidden" name="fields[{$index}][{$field-handle}]" value="{$field-value}">
              <xsl:if test="$entry = 'edit'">
                <xsl:attribute name="type">text</xsl:attribute>
              </xsl:if>
            </input>
            <xsl:if test="not($entry) or $entry = 'sort' or $entry = 'delete'">
              <xsl:choose>
                <xsl:when test="$field-handle = $entry-handle-field">
                  <a href="{$entries-root}/{$field-value/@handle}/{$entry-id}/edit/" title="Edit this {$entry-type}: {$this-entry-title}">
                    <xsl:value-of select="$field-value"/>
                  </a>
                </xsl:when>
                <xsl:when test="$field-handle = 'name' and $entry-type = 'organization' and $website-url">
                  <a href="{$website-url}" title="View site: {substring-before(substring-after($website-url,'http://'),'/')}">
                    <xsl:value-of select="$field-value"/>
                  </a>
                </xsl:when>
                <xsl:when test="$field-handle = 'primary-contact' and $entry-type = 'organization' and $email">
                  <a href="mailto:{$email}" title="Send email to {$email}">
                    <xsl:value-of select="$field-value"/>
                  </a>
                </xsl:when>
                <xsl:when test="$field-handle = 'email' and $email">
                  <a href="mailto:{$email}" title="Send email to {$email}">
                    <xsl:value-of select="$field-value"/>
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$field-value"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <span class="inactive">None</span>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </xsl:when>
    <xsl:when test="$field-type = 'textarea'">
      <xsl:choose>
        <xsl:when test="not($entry) or $entry = 'sort' or $entry = 'delete'">
          <td><xsl:value-of select="$field-value/*"/></td>
        </xsl:when>
        <xsl:when test="$entry = 'edit'">
          <xsl:for-each select="textarea">
            <td>
              <textarea rows="{@rows}" cols="{@cols}" name="fields[{$index}][{$field-handle}]">
                <xsl:value-of select="$field-value/*"/>
              </textarea>
            </td>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$field-type = 'select'">
      <xsl:choose>
        <xsl:when test="not($entry) or $entry = 'sort' or $entry = 'delete'">
          <td>
            <a href="{$parent-page-root}/{$section-link-handle/@handle}/" title="View {$entries-type} by {$field-title}">
              <xsl:if test="$this-branch = 'child'">
                <xsl:attribute name="href">
                  <xsl:value-of select="concat($parent-page-root,'/',$parent-handle,'/',$self-handle,'/')"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="$section-link-title"/>
            </a>
          </td>
        </xsl:when>
        <xsl:when test="$entry = 'edit'">
          <td>
            <select name="fields[{$index}][{$field-handle}]">
              <xsl:for-each select="$section-link-entries">
                <xsl:call-template name="section-link-entries-select-options">
                  <xsl:with-param name="section-link-id" select="$section-link-id"/>
                </xsl:call-template>
              </xsl:for-each>
            </select>
          </td>
        </xsl:when>
      </xsl:choose>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="entries-list-actions">
  <div class="actions">
    <a href="{$entries-root}/delete/" title="Delete multiple {$entries-type}" class="delete button{$delete-active}">
      Delete
    </a>
    <xsl:choose>
      <xsl:when test="not($entry) or $entry = 'sort'">
        <input name="edit" type="submit" value="Edit {$entries-type-title}"/>
      </xsl:when>
      <xsl:when test="$entry = 'edit'">
        <input name="action[{$entries-event}]" type="submit" value="{$current-action-title} All {$entries-type-title}"/>
      </xsl:when>
      <xsl:otherwise>
        <input name="action[{$entries-event}]" type="submit" value="{$current-action-title} Selected {$entries-type-title}"/>
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>

<xsl:template name="submit-entry-actions">
  <div class="actions">
    <xsl:choose>
      <xsl:when test="$action = 'edit'">
        <input name="id" type="hidden" value="{@id}" />
      </xsl:when>
      <xsl:when test="$action = 'delete'">
        <input name="id" type="hidden" value="{@id}" />
        <input name="fields[deleted]" type="hidden" value="'Yes'" />
      </xsl:when>
    </xsl:choose>
    <xsl:if test="$current-action != 'preview'">
      <input name="action[{$entry-event}]" type="submit" value="{$current-action-title} {$entry-type-title}"/>
    </xsl:if>
    <xsl:call-template name="delete-button"/>
  </div>
</xsl:template>

<xsl:template name="delete-button">
  <xsl:param name="entry-handle" select="*[name(.) = $entry-handle-field]"/>
  <xsl:if test="$entry != 'new'">
    <a href="{$entries-root}/{$entry-handle/@handle}/{@id}/delete/" title="Delete this {$entry-type}" class="button delete{$delete-active}">Delete</a>
  </xsl:if>
</xsl:template>

<xsl:template name="confirm-delete">
  <xsl:if test="$action = 'delete' and not(/data/events//@result)">
    <p id="notice" class="warning">Are you sure you want to delete this entry?</p>
  </xsl:if>
  <xsl:if test="$entry = 'delete' and not(/data/events//@result)">
    <p id="notice" class="warning">Are you sure you want to delete the selected entries?</p>
  </xsl:if>
</xsl:template>

<xsl:template name="notice">
  <xsl:for-each select="$event-result">
    <p id="notice" class="{@result}">
      <xsl:choose>
        <xsl:when test="@result = 'success' and $action = 'delete'">
          <xsl:attribute name="class">warning</xsl:attribute>
          Your entry was successfully deleted.
        </xsl:when>
        <xsl:when test="@result = 'success'"><xsl:value-of select="message"/></xsl:when>
        <xsl:when test="@result = 'error'">
            <xsl:text>Error encountered when saving entry: </xsl:text>
            <xsl:for-each select="*[not(descendant::node())]">
              <xsl:value-of select="name(.)"/>
              <xsl:text> field - </xsl:text>
              <xsl:value-of select="@type"/>
            </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>The system encountered errors when saving your entry. Please check if all the required fields have been filled.</xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:for-each>
  <xsl:for-each select="$event-results">
    <xsl:choose>
      <xsl:when test="entry/@result = 'error'">
        <xsl:for-each select="entry[@result = 'error']">
          <p id="notice" class="warning entry-{@position}">
            Error encountered when saving entry
            <xsl:text> </xsl:text>
            <xsl:value-of select="@position + 1"/>
            <xsl:text>: </xsl:text>
            <xsl:for-each select="*[not(descendant::node())]">
              <xsl:value-of select="name(.)"/>
              <xsl:text> field - </xsl:text>
              <xsl:value-of select="@type"/>
            </xsl:for-each>
          </p>
        </xsl:for-each>
      </xsl:when>
      <xsl:when test="entry/@result = 'success'">
        <xsl:choose>
          <xsl:when test="$entry = 'delete'">
            <p id="notice" class="warning">The selected entries were successfully deleted.</p>
          </xsl:when>
          <xsl:when test="count(entry) &gt; 1 and $action = 'delete'">
            <p id="notice" class="warning">Your entries were successfully deleted.</p>
          </xsl:when>
          <xsl:when test="$action = 'delete'">
            <p id="notice" class="warning">Your entry was successfully deleted.</p>
          </xsl:when>
          <xsl:when test="count(entry) &gt; 1">
            <p id="notice" class="success">Your entries have been saved successfully.</p>
          </xsl:when>
          <xsl:otherwise>
            <p id="notice"><xsl:value-of select="message"/></p>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <p id="notice" class="warning">The system encountered errors when saving your entries. Please check if all the required fields have been filled.</p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>