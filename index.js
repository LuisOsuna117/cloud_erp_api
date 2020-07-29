const express = require('express');
var app = express();

/* Database configuration */
const pool = require("./config/database");

app.get('/', function (req, res) {
    res.send('Hello, World!');
});

app.post('/post', function (req, res) {
    res.send('POST');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
    console.log(pool)
});