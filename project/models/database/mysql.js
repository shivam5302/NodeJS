const Sequelize  = require('sequelize');
// const mysql = require('mysql2')
const sequelize = new Sequelize('demo', 'root', '', {
  host: 'localhost',
  dialect: 'mysql'
  

});

module.exports = sequelize;