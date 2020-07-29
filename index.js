const express = require('express');
var app = express();

/* Database configuration */
const pool = require("./config/database");

app.get('/', function (req, res) {
    res.send('Hello, World!');
});

app.post('/post', function (req, res) {
    pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        // Use the connection
        connection.query(`SELECT * FROM ${req.body.table}`, function (error, results, fields) {
            res.send(results);
            // When done with the connection, release it.
            connection.release();
            // Handle error after the release.
            if (error) throw error;
            // Don't use the connection here, it has been returned to the pool.
        });
    });
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});