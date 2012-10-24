<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:import href="common.xsl"/>

 <xsl:param name="mode">xml</xsl:param>

 <xsl:output method="html"
             indent="yes"
             omit-xml-declaration="yes"
             doctype-public="-//W3C//DTD HTML 4.0 Strict//EN" />

 <xsl:template match="/document-part">
  <html
   xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Lisp Machine Manual</title>
      <link rel="stylesheet" type="text/css" href="lmman.css" />
      <script src="javascript.js" language="javascript" type="text/javascript"> </script>
    </head>
  
    <body>
     <xsl:call-template name="navigation"/>
     <xsl:apply-templates mode="toc"/>
    </body>
  </html>
 </xsl:template>

 <xsl:template match="/document-part" mode="toc">
  <xsl:param name="file"/>
  <xsl:apply-templates mode="toc">
   <xsl:with-param name="file" select="$file"/>
  </xsl:apply-templates>
 </xsl:template>

 <xsl:template match="include" mode="toc">
  <xsl:apply-templates select="document(concat(@file, '.xml'))" mode="toc">
   <xsl:with-param name="file" select="@file"/>
  </xsl:apply-templates>
 </xsl:template>

 <xsl:template match="chapter" mode="toc">
  <xsl:param name="file"/>
  <h1>
   <xsl:value-of select="@number"/>
   <xsl:value-of select="' '"/>
   <a href="{$file}.xml"><xsl:value-of select="@title"/></a>
  </h1>
  <ul>
   <xsl:apply-templates mode="toc">
    <xsl:with-param name="file" select="$file"/>
   </xsl:apply-templates>
  </ul>
 </xsl:template>

 <xsl:template match="section" mode="toc">
  <xsl:param name="file"/>
  <li>
   <a href="{$file}.xml#{@name}-section"><xsl:value-of select="@title"/></a>
  </li>
 </xsl:template>

 <xsl:template match="text()" mode="toc"></xsl:template>

</xsl:stylesheet>