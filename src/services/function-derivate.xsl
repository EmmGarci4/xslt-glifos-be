<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
   <p>
   <xsl:apply-templates/>
   </p>
  </xsl:template>

 <xsl:template match="plus"><plus><xsl:apply-templates/></plus></xsl:template>

<xsl:template match="minus"><minus><xsl:apply-templates/></minus></xsl:template>

 <xsl:template match="times">
 <xsl:apply-templates/>
  </xsl:template>

   <xsl:template match="division">
<xsl:apply-templates/>
  

  </xsl:template>

<xsl:template match="power">
  <times>
    <xsl:copy-of select="*[last()]"/> 
    
      <xsl:choose>
        <xsl:when test="name(*[last()]) != 'const'">
          <power>
              <xsl:copy-of select="*[1]"/>
              <minus>
                <xsl:copy-of select="*[last()]"/>
                <const>1</const>
              </minus>
          </power>
        </xsl:when>
        <xsl:when test="name(*[last()]) = 'const' and *[last()]>2">
          <power>
                <xsl:copy-of select="*[1]"/>
                <const><xsl:value-of select="*[last()] -1"/></const>
          </power>
        </xsl:when>
        <xsl:when test="name(*[last()]) = 'const' and *[last()]=2">
            <xsl:copy-of select="*[1]"/>
        </xsl:when>
      <xsl:when test="name(*[last()]) = 'const' and *[last()]=1">  
          </xsl:when>
        <xsl:otherwise>
               <xsl:apply-templates/>  
        </xsl:otherwise>
      </xsl:choose> 
    </times>
  </xsl:template>

 <xsl:template match="const"></xsl:template>

<xsl:template match="var"></xsl:template>

</xsl:stylesheet>
