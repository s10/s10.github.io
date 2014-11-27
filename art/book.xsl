<?xml version="1.0" encoding="UTF-8" ?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html"  doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<meta name="title" content="Стихотворения" />
<meta name="author" content="Влад Эстен" />
<meta name="subject" content="Лучшие стихотворения, разделенные на циклы и подциклы" />
<meta name="language" content="ru" />
<title><xsl:value-of select="/book/info/book-title"/> — Влад Эстен</title>
<style type="text/css" media="screen">
* { margin: 0; padding: 0; }
body { padding: 20px; text-align: center; }
.cycle { margin: 20px auto; text-align: left; width: 600px; }
#info { margin: 30px; }
#info h1 { margin: 0; font: 400% Georgia, "Times New Roman", Times, serif; }
#info h2 { margin: 0; font: 200% Georgia, "Times New Roman", Times, serif;}
#info h3 { margin: 0; padding: 0; font: italic normal 120% serif; color: lightgray; }
h1 { margin: 50px 0 10px 0; padding-top: 10px; font: bold 300% "Courier New", monospace; white-space: pre; text-align: center; }
h2 { margin: 10px 0 0 40px; font: bold 140% "Courier New", monospace; }
pre { font: normal 12pt "Times New Roman", serif; }
.date_t { margin: 15px 0px 30px 130px; font: italic normal 10pt "Times New Roman", serif; color: #777; text-align: left; }
em { display: inline; font-style: italic; }
.epigraph { display: block; margin-left: 200px; font-size: 10pt; font-style: italic; clear: both; }
</style>
</head>
<body>
<xsl:apply-templates/>
</body>
</html>
</xsl:template>
 
<xsl:template match="cycle">
	<div class="cycle">
	<h1><xsl:value-of select="title"/></h1>
	<xsl:apply-templates select="poem"/>
	</div>
</xsl:template>

<xsl:template match="info">
	<div id="info">
	<xsl:apply-templates select="author"/>
	<h1 id="book-title"><xsl:value-of select="book-title"/></h1>
	</div>
</xsl:template>

<xsl:template match="author">
	<h2><xsl:value-of select="pen-name"/></h2>
  <!--<h3>(<xsl:value-of select="first-name"/><xsl:text> </xsl:text><xsl:value-of select="last-name"/>)</h3>-->
</xsl:template>
    
<xsl:template match="poem">  
     <h2><xsl:value-of select="name"/></h2>
     <xsl:apply-templates select="epigraph"/>
     <xsl:apply-templates select="text"/>
     <xsl:apply-templates select="end"/>
</xsl:template>

<xsl:template match="text">
	<pre><xsl:apply-templates/></pre>
</xsl:template>

<xsl:template match="emphasis">
	<em><xsl:value-of select="."/></em>
</xsl:template>

<xsl:template match="end">
	<p class="date_t">{<xsl:apply-templates select="date"/>; <xsl:apply-templates select="place"/>}</p>
</xsl:template>

<xsl:template match="date">
	<xsl:value-of select="day"/> <xsl:apply-templates select="month"/> <xsl:value-of select="year" /> года</xsl:template>
	
<xsl:template match="month">
	<xsl:if test="number() = 01"><xsl:text> января </xsl:text></xsl:if> 
	<xsl:if test="number() = 02"><xsl:text> февраля </xsl:text></xsl:if> 
	<xsl:if test="number() = 03"><xsl:text> марта </xsl:text></xsl:if> 
	<xsl:if test="number() = 04"><xsl:text> апреля </xsl:text></xsl:if> 
	<xsl:if test="number() = 05"><xsl:text> мая </xsl:text></xsl:if> 
	<xsl:if test="number() = 06"><xsl:text> июня </xsl:text></xsl:if> 
	<xsl:if test="number() = 07"><xsl:text> июля </xsl:text></xsl:if> 
	<xsl:if test="number() = 08"><xsl:text> августа </xsl:text></xsl:if> 
	<xsl:if test="number() = 09"><xsl:text> сентября </xsl:text></xsl:if> 
	<xsl:if test="number() = 10"><xsl:text> октября </xsl:text></xsl:if> 
	<xsl:if test="number() = 11"><xsl:text> ноября </xsl:text></xsl:if> 
	<xsl:if test="number() = 12"><xsl:text> декабря </xsl:text></xsl:if> 
	<xsl:if test="number() = false()"><xsl:text> числа какого-то месяца </xsl:text></xsl:if> 
</xsl:template>

<xsl:template match="place">
	<xsl:value-of select="land"/>, <xsl:if test="string-length(region) &gt; 0"><xsl:value-of select="region"/><xsl:text>, </xsl:text></xsl:if><xsl:value-of select="settlement"/>
</xsl:template>

<xsl:template match="epigraph">
	<div class="epigraph">
	<xsl:value-of select="."/>
	</div>
</xsl:template>

</xsl:stylesheet>
