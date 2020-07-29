const mysql = require("mysql");
const util = require("util");
const keys = require("./keys");

mysql.createConnection(keys);

const pool = mysql.createPool(keys);
pool.getConnection((err, connection) => {
    if (err) {
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
    if (connection) {
        connection.release();
        pool.query = util.promisify(pool.query);
        log.yellow(
            `Connected to mysql://${keys.host}:${keys.port}/${keys.database}`
        );
    }
});

module.exports = pool;
