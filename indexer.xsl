<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:param name="mode">xml</xsl:param>

 <xsl:output indent="yes"/>

 <xsl:template match="/document-part">

  <xsl:processing-instruction name="xml-stylesheet">
   <xsl:text>type="text/xsl" href="index.xsl"</xsl:text>
  </xsl:processing-instruction>

  <index>
   <xsl:apply-templates mode="index"/>
  </index>
 </xsl:template>

 <xsl:template match="include" mode="index">
  <xsl:apply-templates select="document(concat(@file, '.xml'))" mode="index">
   <xsl:with-param name="file" select="@file"/>
  </xsl:apply-templates>
 </xsl:template>

 <xsl:template match="/document-part" mode="index">
  <xsl:param name="file"/>
  <xsl:apply-templates select="*" mode="index">
   <xsl:with-param name="file" select="$file"/>
  </xsl:apply-templates>
 </xsl:template>

 <xsl:template match="index-entry" mode="index">
  <xsl:param name="file"/>
  <index-entry>
   <xsl:attribute name="file"><xsl:value-of select="$file"/></xsl:attribute>
   <xsl:attribute name="index"><xsl:value-of select="@index"/></xsl:attribute>
   <xsl:attribute name="key"><xsl:value-of select="@title"/></xsl:attribute>
   <xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
  </index-entry>
 </xsl:template>

 <xsl:template match="define" mode="index">
  <xsl:param name="file"/>
  <index-entry>
   <xsl:attribute name="file"><xsl:value-of select="$file"/></xsl:attribute>
   <xsl:attribute name="index">
    <xsl:choose>
     <xsl:when test="@type = 'fun'">functions</xsl:when>
     <xsl:when test="@type = 'metamethod'">method</xsl:when>
     <xsl:when test="@type = 'const'">constant</xsl:when>
     <xsl:when test="@type = 'spec'">functions</xsl:when>
     <xsl:when test="@type = 'mac'">functions</xsl:when>
     <xsl:when test="@type = 'var'">variables</xsl:when>
     <xsl:when test="@type = 'meter'">meter</xsl:when>
     <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
    </xsl:choose>
   </xsl:attribute>
   <xsl:attribute name="key"><xsl:value-of select="concat(@key, '-', @type)"/></xsl:attribute>
   <xsl:attribute name="title"><xsl:value-of select="@name"/></xsl:attribute>
  </index-entry>
 </xsl:template>

 <xsl:template match="text()" mode="index"></xsl:template>

</xsl:stylesheet>