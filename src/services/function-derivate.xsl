<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
   <xsl:copy-of select="/"/>
  </xsl:template>

 <xsl:template match="plus"><plus><xsl:apply-templates/></plus></xsl:template>

<xsl:template match="minus"><minus><xsl:apply-templates/></minus></xsl:template>

 <xsl:template match="times">

  </xsl:template>

   <xsl:template match="division">

  </xsl:template>

<xsl:template match="power">

  </xsl:template>

 <xsl:template match="const"><const><xsl:value-of select="."/></const></xsl:template>

<xsl:template match="var"><var><xsl:value-of select="."/></var></xsl:template>

</xsl:stylesheet>
