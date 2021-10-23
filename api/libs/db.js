var mysql = require('mysql');
const config = require('../conf/config');

var pool  = mysql.createPool(config.database);

async function execute(sql, args) {
    return new Promise((resolve, reject) => {
        pool.query(
            sql, args,
            function(err, res) {
                if (err) {
                    reject(err);
                } else {
                    resolve(res);
                }
            }
        );
    });
}

exports.pool = pool;
exports.execute = execute;
