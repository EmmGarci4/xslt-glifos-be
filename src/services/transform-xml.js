const fs = require('fs')
const path = require('path')
const SaxonJS = require('saxon-js')

async function transformXml(request){
    return await SaxonJS.transform({
        stylesheetFileName: __dirname+"/function-derivate.sef.json",
        sourceFileName:  __dirname+"/function.xml",
        destination: "serialized"
    }, "async").then(output=>output.principalResult)
}

module.exports = transformXml;