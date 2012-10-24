<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:import href="common.xsl"/>

 <xsl:param name="mode">xml</xsl:param>

 <xsl:key name="index" match="index-entry" use="@index"/>

 <xsl:output method="html"
             indent="yes"
             omit-xml-declaration="yes"
             doctype-public="-//W3C//DTD HTML 4.0 Strict//EN" />

 <xsl:template match="/index">
  <html
   xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>Lisp Machine Manual - Index</title>
      <link rel="stylesheet" type="text/css" href="lmman.css" />
      <script src="javascript.js" language="javascript" type="text/javascript"> </script>
    </head>
  
    <body>
     <xsl:call-template name="navigation"/>
     <h1>Concepts</h1>
     <ul>
      <xsl:apply-templates select="key('index', 'concepts')">
       <xsl:sort select="@title"/>
      </xsl:apply-templates>
     </ul>
     <h1>Functions</h1>
     <ul>
      <xsl:apply-templates select="key('index', 'functions')">
       <xsl:sort select="@title"/>
      </xsl:apply-templates>
     </ul>
    </body>
  </html>
 </xsl:template>

 <xsl:template match="index-entry">
  <li><a index="{@index}" href="{@file}.xml#{@title}"><xsl:value-of select="@title"/></a></li>
 </xsl:template>

 <xsl:template match="text()" mode="toc"></xsl:template>

</xsl:stylesheet>