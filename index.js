const express = require('express');
const bodyParser = require('body-parser');
const log = require("./config/chalk");
var app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

/* Database configuration */
const pool = require("./config/database");

function manageError(err) {
    log.red(err);
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
        log.red("Database connection was closed.");
    }
    if (err.code === "ER_CON_COUNT_ERROR") {
        log.red("Database has too many connections.");
    }
    if (err.code === "ECONNREFUSED") {
        log.red("Database connection was refused.");
    }
}

app.get('/getPurchases', function (req, res) {
    var result = {};
    pool.getConnection(function (err, connection) {
        if (err) {
            manageError(err);
        }
        // Use the connection
        connection.query(`CALL loadPurchases`, function (error, results, fields) {
            res.send(results[0]);
            // When done with the connection, release it.
            connection.release();
            // Handle error after the release.
            if (error) {
                log.red(`MySQLERR ${error.code}: ${error.message}`)
            }
            // Don't use the connection here, it has been returned to the pool.
        });
    });
});

app.post('/userLogin', function (req, res) {
    pool.getConnection(function (err, connection) {
        if (err) {
            manageError(err);
        } 
        // Use the connection
        connection.query(`CALL userLogin('${req.body.username}','${req.body.password}')`, function (error, results, fields) {
            res.send(results);
            // When done with the connection, release it.
            connection.release();
            // Handle error after the release.
            if (error) {
                log.red(`MySQLERR ${error.code}: ${error.message}`) 
            }
            // Don't use the connection here, it has been returned to the pool.
        });
    });
});

app.put('/put', function (req, res) {
    pool.getConnection(function (err, connection) {
        if (err) {
            manageError(err);
        }
        // Use the connection
        connection.query(`SELECT * FROM ${req.body.table}`, function (error, results, fields) {
            res.send(results);
            // When done with the connection, release it.
            connection.release();
            // Handle error after the release.
            if (error) {
                log.red(`MySQLERR ${error.code}: ${error.message}`)
            }
            // Don't use the connection here, it has been returned to the pool.
        });
    });
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
});