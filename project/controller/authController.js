const User = require('.././models/user')
const bcrypt = require('bcrypt')
const passport = require('passport')


function authController(){

	return {
		// index(req,res){
		// 	res.render('index');
		// },
		login(req,res){
			// res.send('yes')
			res.render('auth/login');
		},
		async postLogin(req,res,next){
			const {email, password} = req.body
			// console.log(email,password)
			if(!email || !passport){
				req.flash('error','All Fields Are required');
				return res.redirect('/login')
			}
			
			const user = await User.findOne({where:{email: email}})
			if(user){
				res.send(user)
			}
			else{
				res.send('not found')
			}
		},
		logout(req,res){
			req.logout()
			// req.flash('message')
			// req.user = null;
           res.redirect('/')
		},
		signup(req,res){
			res.render('auth/signup');
		},
		async postSignup(req,res){


			const {fullname,mobile,email,password} = req.body

			User.sync();

			if(!fullname || !mobile || !email || !password){
				req.flash('error','All fields required')
				// req.flash('firstname',firstname)
				// req.flash('lastname',lastname)
				// req.flash('email',email)
				// req.flash('username',username)
				res.redirect('/signup')
			}
			const hashedPassword = await bcrypt.hashSync(password, 10);
	// 		// //create user

			 let data =
		 
		            {
		                email,
		 
		                password:hashedPassword,
		 
		                fullname,
		 
		                

		                mobile
		 
		            };

	await User.findOne({where:{email}}).then(val=>{
		if(val){
			req.flash('error','Email already Taken')
			req.flash('fullname',fullname)
			req.flash('mobile',mobile)
			req.flash('email',email);
			res.redirect('/signup')
			// res.send('user exist')
			
		}
		

	})



			User.sync().then(() => {
			    // Table created
			    return User.create(data);
			  });


	  res.redirect('/login')


		}

	}
}

module.exports = authController;