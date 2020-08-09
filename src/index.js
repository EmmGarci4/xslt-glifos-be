var express = require('express');
var app = express();
const http = require('http').Server(app);
var bodyParser = require('body-parser');
var transformXml = require('./services/transform-xml')

//middlewares de bodyparser
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

//rutas
app.post('/',async (req,res)=>{
    try {
        console.log(req.body)
        let output = await transformXml(req.body.xmlText)   
        res.status(200).send(output);
    } catch (error) {
        console.log("ALGO SALIO MAL")
        console.log(error.message)
        res.status(500).send({message:error.message});
    }
})


//iniciando server
http.listen(8080, () => {
    console.log("Server listen on port 8080");
});