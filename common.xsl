<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

 <xsl:template name="navigation">
  <div id="navigation">
   <div class="nav-button"><a href="frontpage.html">Home</a></div>
   <div class="nav-button"><a href="toc.html">Contents</a></div>
   <div class="nav-button"><a href="index.xml">Index</a></div>
   <br/>
   <div class="nav-button" onclick="page_down();">Down</div>
  </div>
 </xsl:template>
</xsl:stylesheet>