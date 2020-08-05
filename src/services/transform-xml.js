const fs = require('fs')
const path = require('path')
const SaxonJS = require('saxon-js')

async function transformXml(request){
    console.log(__dirname+"/test.sef.json")
    return await SaxonJS.transform({
        stylesheetFileName: __dirname+"/test.sef.json",
        sourceFileName:  __dirname+"/test.xml",
        destination: "serialized"
    }, "async").then(output=>output.principalResult)
}

module.exports = transformXml;