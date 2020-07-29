const chalk = require("chalk");

const log = {
    /**
     * Makes a console.log in red color
     * @param {String} message
     */
    red(message) {
        if (process.env.NODE_ENV !== "productio") {
            console.log(chalk.bold.red(message));
        }
    },

    /**
     * Makes a console.log in blue color
     * @param {String} message
     */
    blue(message) {
        if (process.env.NODE_ENV !== "productio") {
            console.log(chalk.bold.blue(message));
        }
    },

    /**
     * Makes a console.log in green color
     * @param {String} message
     */
    green(message) {
        if (process.env.NODE_ENV !== "productio") {
            console.log(chalk.bold.green(message));
        }
    },

    /**
     * Makes a console.log in yellow color
     * @param {String} message
     */
    yellow(message) {
        if (process.env.NODE_ENV !== "productio") {
            console.log(chalk.bold.yellow(message));
        }
    },
};

module.exports = log;
