
 const Sequelize = require('sequelize')
 const sequelize = require('./database/mysql')

const productsCategory = sequelize.define('productsCategory', {
    
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
 
        categoryName: {
            type: Sequelize.STRING,
            notEmpty: true
        },
 
 
    });
 
module.exports = productsCategory