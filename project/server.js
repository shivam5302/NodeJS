require('dotenv').config()

const express = require('express')
const path = require('path')
// const sequelize = require('sequelize');
const session = require('express-session')
const passport = require('passport')
const bodyParser = require('body-parser')
const flash = require('express-flash')
const sequelize = require('./models/database/mysql');
// // const Sequelize = require('sequelize')
const route = require('./routes/routes')

var SequelizeStore = require('connect-session-sequelize')(session.Store);
const app = express();
const PORT = process.env.PORT




// //check the connection to database

sequelize
        .authenticate()
        .then(() => {
            console.log('Connection has been established successfully.');
        })
        .catch((err) => {
            console.log('Unable to connect to the database:', err);
        });



// //use ejs template
app.set('view engine','ejs')
//Store Session with sequelize
var mySessionStore = new SequelizeStore({
    db:sequelize
})
mySessionStore.sync();
// //set session
app.use(session({
	secret:'thisismysecret',
	resave:false,
	store:mySessionStore,
	saveUninitialized:false,
	cookie:{maxAge:1000*60*60*24}
}))

// //passport config
const passportInit = require('./controller/config/passport')
passportInit(passport);
app.use(passport.initialize())
app.use(passport.session())

app.use(express.json());

// // parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
 
// // parse application/json
app.use(bodyParser.json())


// //use flash for messages
app.use(flash())

// load assets
app.use('/css', express.static(path.resolve(__dirname, "public/css")))
app.use('/images', express.static(path.resolve(__dirname, "public/images")))
app.use('/js', express.static(path.resolve(__dirname, "public/js")))

//global middleware
app.use((req,res,next)=>{
	res.locals.session = req.session
	res.locals.user = req.user
    next();
})


//routes
app.use('/',route)



//connect to server
app.listen(PORT,()=>{
	console.log(`server started on ${PORT}`)
})


