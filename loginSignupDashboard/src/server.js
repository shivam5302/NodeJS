require('dotenv').config();

const express = require('express');
const configViewEngine = require('./configs/viewEngine');
const initWebRoutes = require('./routes/web');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const connectFlash = require('connect-flash');
const passport = require('passport');
// import express from "express";
// import configViewEngine from "./configs/viewEngine";
// import initWebRoutes from "./routes/web";
// import bodyParser from "body-parser";
// import cookieParser from 'cookie-parser';
// import session from "express-session";
// import connectFlash from "connect-flash";
// import passport from "passport";

let app = express();

//use cookie parser
app.use(cookieParser('secret'));

//config session
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24 // 86400000 1 day
    }
}));

// Enable body parser post data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//Config view engine
configViewEngine(app);

//Enable flash message
app.use(connectFlash());

//Config passport middleware
app.use(passport.initialize());
app.use(passport.session());

// init all web routes
initWebRoutes(app);

let port = 8080;
app.listen(port, () => console.log(`Building a login system with NodeJS is running on port ${port}!`));
