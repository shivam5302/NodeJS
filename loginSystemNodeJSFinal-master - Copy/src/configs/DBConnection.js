const mysql = require('mysql2')
//require('dotenv').config();
// import mysql from "mysql2";

let connection = mysql.createConnection({
    host: 'localhost',//process.env.DB_HOST,
    user: 'root',//process.env.DB_USERNAME,
    password:'',// process.env.DB_PASSWORD,
    database:'jwellery' //process.env.DB_NAME
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("Database connected!");
});

module.exports = connection;
