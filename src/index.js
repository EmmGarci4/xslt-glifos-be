var express = require('express');
var app = express();
const http = require('http').Server(app);
var bodyParser = require('body-parser');


//middlewares de bodyparser
app.use(bodyParser.urlencoded({extended:false}));
//app.use(bodyParser.xml());

//rutas
app.get('/',(req,res)=>{
    res.status(200).send("hi from node js");
})


//iniciando server
http.listen(8080, () => {
    console.log("Server listen on port 8080");
});