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
     <xsl:apply-templates/>
    </body>
  </html>
 </xsl:template>

 <!-- structural elements -->

 <xsl:template match="chapter">
  <h1><xsl:value-of select="@number"/>.<xsl:value-of select="' '"/><xsl:value-of select="@title"/></h1>
  <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="section">
  <a name="{@name}-section"/>
  <h2><xsl:value-of select="@chapter-number"/>.<xsl:value-of select="@number"/><xsl:value-of select="' '"/><xsl:value-of select="@title"/></h2>
  <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="p">
  <xsl:if test="@indent = '1'">
   <xsl:attribute name="class">indented</xsl:attribute>
  </xsl:if>
  <p>
   <xsl:apply-templates/>
  </p>
 </xsl:template>

 <xsl:template match="pre">
<pre>
<xsl:apply-templates/>
</pre>
 </xsl:template>

 <xsl:template match="center">
  <h3><xsl:apply-templates/></h3>
 </xsl:template>

 <!-- hyperlinks -->

 <xsl:template match="a">
  <a name="{@name}"/>
 </xsl:template>

 <xsl:template match="index-entry">
  <a name="{@title}"/>
 </xsl:template>

 <xsl:template match="definition">
  <div class="definition">
   <xsl:apply-templates/>
  </div>
 </xsl:template>

 <xsl:template match="define">
  <div class="define">
   <a name="{@key}"/>
   <span class="definition-type-title">
    <xsl:choose>
     <xsl:when test="@type = 'message'">Message</xsl:when>
     <xsl:when test="@type = 'fun'">Function</xsl:when>
     <xsl:when test="@type = 'method'">Method</xsl:when>
     <xsl:when test="@type = 'metamethod'">Meta-Method</xsl:when>
     <xsl:when test="@type = 'const'">Constant</xsl:when>
     <xsl:when test="@type = 'condition'">Condition</xsl:when>
     <xsl:when test="@type = 'spec'">Special Form</xsl:when>
     <xsl:when test="@type = 'mac'">Macro</xsl:when>
     <xsl:when test="@type = 'flavor'">Flavor</xsl:when>
     <xsl:when test="@type = 'flavor-condition'">Flavor Condition</xsl:when>
     <xsl:when test="@type = 'condition-flavor'">Condition Flavor</xsl:when>
     <xsl:when test="@type = 'var'">Variable</xsl:when>
     <xsl:when test="@type = 'initoption'">Initialization Option</xsl:when>
     <xsl:when test="@type = 'meter'">Meter</xsl:when>
     <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
    </xsl:choose>
   </span>
   <b><xsl:value-of select="@name"/></b>
   <xsl:value-of select="' '"/>
   <xsl:apply-templates/>
  </div>
 </xsl:template>

 <xsl:template match="args">
  <span class="arguments">
   <xsl:apply-templates/>
  </span>
 </xsl:template>

 <xsl:template match="description">
  <div class="description">
   <xsl:apply-templates/>
  </div>
 </xsl:template>

 <xsl:template match="ref">
  <a href="{@definition-in-file}.xml#{@key}"><xsl:value-of select="@title"/></a>
 </xsl:template>

 <xsl:template match="a">
  <a href="{@href}"><xsl:apply-templates/></a>
 </xsl:template>

 <!-- font selections -->
 <xsl:template match="standard">
  <span class="standard"><xsl:apply-templates/></span>
 </xsl:template>

 <xsl:template match="obj">
  <span class="obj"><xsl:apply-templates/></span>
 </xsl:template>

 <xsl:template match="arg">
  <span class="arg"><xsl:apply-templates/></span>
 </xsl:template>

 <xsl:template match="lisp">
<pre><xsl:apply-templates/></pre>
 </xsl:template>

 <!-- tables -->

 <xsl:template match="table">
  <table>
   <tbody>
    <xsl:apply-templates/>
   </tbody>
  </table>
 </xsl:template>

 <xsl:template match="tr">
  <tr>
   <xsl:apply-templates/>
  </tr>
 </xsl:template>

 <xsl:template match="td">
  <td>
   <xsl:apply-templates/>
  </td>
 </xsl:template>

</xsl:stylesheet>