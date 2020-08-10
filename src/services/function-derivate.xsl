<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="utf-8" indent="yes"/> 

 <xsl:template match="/">
   <f>
   <xsl:apply-templates/>
   </f>
  </xsl:template>
  <!---derivada de una suma es igual a la suma de las derivadas-->
 <xsl:template match="plus"><plus><xsl:apply-templates/></plus></xsl:template>
  <!---derivada de una resta es igual a la resta de las derivadas-->
<xsl:template match="minus"><minus><xsl:apply-templates/></minus></xsl:template>

<xsl:template match="times">
     <xsl:choose>
      <!---la derivada de una constante por una funcion es la constante por la derivada-->
        <xsl:when test="name(*[1]) = 'const'">
         <times>
         <xsl:copy-of select="*[1]"/>
          <xsl:apply-templates/>
         </times>
        </xsl:when>
        <!---la derivada de una multiplicacion es igual a: f1' por f2 más f1 por f2'-->
         <xsl:when test="name(*[1]) != 'const' and name(*[last()]) != 'const'">
         <plus>
         <times>
         <xsl:apply-templates select="*[1]"/>
         <xsl:copy-of select="*[last()]"/>
         </times>
         <times>
         <xsl:copy-of select="*[1]"/>
         <xsl:apply-templates select="*[last()]"/>
         </times>
         </plus>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates/>  
        </xsl:otherwise>
        </xsl:choose>    
</xsl:template>

<xsl:template match="div">
  <div>
  <!---divisor-->
    <xsl:choose>
        <!---la derivada de una division es = (f1'f2 - f1f2')/f2 -> 2 -->
         <xsl:when test="name(*[1]) != 'const' and name(*[last()]) != 'const'">
         <minus>
         <times>
         <xsl:apply-templates select="*[1]"/>
         <xsl:copy-of select="*[last()]"/>
         </times>
         <times>
         <xsl:copy-of select="*[1]"/>
         <xsl:apply-templates select="*[last()]"/>
         </times>
         </minus>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates/>  
        </xsl:otherwise>
        </xsl:choose>
      <!--divisor-->
      <power>
        <xsl:copy-of select="*[last()]"/>
        <const>2</const>
      </power>
  </div>
</xsl:template>

<xsl:template match="power">
  <times>
    <xsl:copy-of select="*[last()]"/> 

      <xsl:choose>
      <!---la derivada de una potencia es el -->
        <xsl:when test="name(*[last()]) != 'const'">
          <power>
              <xsl:copy-of select="*[1]"/>
              <minus>
                <xsl:copy-of select="*[last()]"/>
                <const>1</const>
              </minus>
          </power>
        </xsl:when>
        <!---derivada de una potencia entera mayor a 2 = n*var elevado n-1-->
        <xsl:when test="name(*[last()]) = 'const' and *[last()]>2">
          <power>
                <xsl:copy-of select="*[1]"/>
                <const><xsl:value-of select="*[last()] -1"/></const>
          </power>
        </xsl:when>
        <!---derivada de una potencia entera igual a 2 = var-->
        <xsl:when test="name(*[last()]) = 'const' and *[last()]=2">
            <xsl:copy-of select="*[1]"/>
        </xsl:when>
        <!---derivada de una potencia entera igual a 1: variable = 1-->
      <xsl:when test="name(*[last()]) = 'const' and *[last()]=1">  
          <const>1</const>
          </xsl:when>
        <xsl:otherwise>
               <xsl:apply-templates/>  
        </xsl:otherwise>
      </xsl:choose> 
    </times>
</xsl:template>

<!---aplicados para no mostrar solo valores-->
 <xsl:template match="const"></xsl:template>

<xsl:template match="var"> </xsl:template>

</xsl:stylesheet>
