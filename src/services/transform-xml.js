const fs = require('fs')
const path = require('path')
const SaxonJS = require('saxon-js')
//xslt3 -t -xsl:function-derivate.xsl -export:function-derivate.sef.json -nogo

async function transformXml(xmlText){
    return await SaxonJS.transform({
        stylesheetFileName: __dirname+"/function-derivate.sef.json",
        sourceText:xmlText,
        destination: "serialized"
    }, "async").then(output=>output.principalResult)
}

module.exports = transformXml;