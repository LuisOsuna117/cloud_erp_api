var express = require('express');
var app = express();

app.get('/', function (req, res) {
    res.send('Hola David Fernando Rivera, te estoy vigilando!');
});

app.post('/post', function (req, res) {
    res.send('POST');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000! v0.1.1');
    console.log(process.env);
});