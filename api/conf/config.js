var config = require("./config.json");
config.mode = process.env.mode || 'production';
module.exports = config;