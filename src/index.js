var express = require('express');
var app = express();
const http = require('http').Server(app);
var bodyParser = require('body-parser');
var transformXml = require('./services/transform-xml')

//middlewares de bodyparser
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

//cors
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});


//rutas
app.post('/derivate',async (req,res)=>{
    try {
        let output = await transformXml(req.body.xmlText)  
        res.status(200).send({derivate:output});
    } catch (error) {
        //console.log(error.message)
        res.status(500).send(error.message);
    }
})


app.use('/', express.static(__dirname + '/public'));

//iniciando server
http.listen(8080, () => {
    console.log("Server listen on port 8080");
});
