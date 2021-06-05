const express = require('express')
const route = express.Router()
const authController = require('../controller/authController')
const productController = require('../controller/productController')
const cartController = require('../controller/cartController')
const orderController = require('../controller/orderController')
const checkLoggedIn = require('.././controller/middleware/checkLoggedIn')

const passport = require('passport')


route.get('/',productController().index);
route.get('/login',checkLoggedIn,authController().login)
route.post("/login", passport.authenticate("local", {
        successRedirect: "/",
        failureRedirect: "/login",
        successFlash: true,
        failureFlash: true
    }));

route.post('/logout',authController().logout)
route.get('/signup',checkLoggedIn,authController().signup);
route.post('/signup',authController().postSignup);

route.get('/product/:id',productController().productView)

route.get('/viewCart',cartController().viewCart)

route.post('/updateCart',cartController().updateCart);

route.post('/order',orderController().store)

route.get('/customers/orders',orderController().index)

//check for session
route.get('/checkSession',(req,res)=>{
	res.send(JSON.stringify(req.session.cart.items[1]));
})

route.get('/user',(req,res)=>{
	res.send(user);
})




module.exports = route