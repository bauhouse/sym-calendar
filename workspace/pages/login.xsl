<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public-master.xsl"/>
<xsl:import href="../utilities/typography.xsl"/>

<xsl:template match="data">
  <xsl:for-each select="current-page/entry">
    <h2>Login</h2>
    <xsl:choose>
      <xsl:when test="$is-logged-in">
        <fieldset class="settings">
          <legend>Login Status</legend>
          <p>You have successfully logged in as <xsl:value-of select="$name"/>, <xsl:value-of select="$user-type"/>.</p>
        </fieldset>
        <fieldset class="settings">
          <legend>Body</legend>
          <xsl:apply-templates select="body"/>
        </fieldset>
        <div class="actions">
        </div>
      </xsl:when>
      <xsl:otherwise>
        <fieldset class="settings">
          <legend>Login Status</legend>
          <xsl:apply-templates select="description"/>
          <label>Username
            <input name="username" type="text"/>
          </label>
          <label>Password
            <input name="password" type="password"/>
          </label>
        </fieldset>
        <div class="actions">
          <input name="action[login]" type="submit" value="Login"/>
          <input name="redirect" type="hidden" value="{$root}/symphony/"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:template>
  
</xsl:stylesheet>
