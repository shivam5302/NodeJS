
 const Sequelize = require('sequelize')
 const sequelize = require('./database/mysql')

const User = sequelize.define('user', {
    
   
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: Sequelize.INTEGER
        },
 
        fullname: {
            type: Sequelize.STRING,
            notEmpty: true
        },
 
        mobile: {
            type: Sequelize.STRING,
            notEmpty: true
        },
 
        // username: {
        //     type: Sequelize.TEXT
        // },
 
 
        email: {
            type: Sequelize.STRING,
            validate: {
                isEmail: true
            }
        },
 
        password: {
            type: Sequelize.STRING,
            allowNull: false
        },
 
      
 
 
    });
 
module.exports = User