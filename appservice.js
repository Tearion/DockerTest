var fs = require('fs');
var http = require('http');
var https = require('https');
var privateKey = fs.readFileSync('tls.key','utf8');
var certificate = fs.readFileSync('tls.crt','utf8');

var port = 3000;
var portsecure = 3300;

var credentials = {key: privateKey, cert: certificate}
var express = require('express');
var app = express();

app.get('/', (req, res) => {
    res.send('Hello world from docker!')
})

var httpServer = http.createServer(app);
var httpsServer = https.createServer(credentials, app);


httpServer.listen(port);
httpsServer.listen(portsecure);
console.log("Application service started.")