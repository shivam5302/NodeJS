
 const Sequelize = require('sequelize')
 const sequelize = require('./database/mysql')

const product = sequelize.define('product', {
    
    
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
 
        sku: {
            type: Sequelize.STRING,
            notEmpty: true
        },
 
        name: {
            type: Sequelize.STRING,
            notEmpty: true
        },

        price: {
            type: Sequelize.STRING,
            notEmpty: true
        },
        shortDesc: {
            type: Sequelize.STRING,
            notEmpty: true
        },

        longDesc: {
            type: Sequelize.STRING,
            notEmpty: true
        },

        image: {
            type: Sequelize.STRING,
            notEmpty: true
        },
        
        category: {
            type: Sequelize.STRING,
            notEmpty: true
        },

 
    });
 
module.exports = product