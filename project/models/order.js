
 const Sequelize = require('sequelize')
 const sequelize = require('./database/mysql')

const Order = sequelize.define('order', {
    
        
         id: {
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },

        customerId:{

            type: Sequelize.INTEGER,
            notEmpty: true

        },

        items: {
            type: Sequelize.STRING,
            notEmpty: true
            },

       
 
        phone: {
            type: Sequelize.STRING,
            notEmpty: true
        },

        address: {
            type: Sequelize.STRING,
            notEmpty: true
        },        
        paymentType: {
            type: Sequelize.STRING,
            defaultValue: "COD",
            notEmpty: true
        }, 

        status: {
            type: Sequelize.STRING,
            defaultValue: "order_placed",
            notEmpty: true
        }, 
 
      
 
 
    });
 
module.exports = Order