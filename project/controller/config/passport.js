const LocalStrategy = require('passport-local').Strategy
const User = require('../../models/user')
const bcrypt = require('bcrypt')



function init(passport){
		
	passport.use(new LocalStrategy({
		usernameField: 'email',
		passwordField: 'password',
		// passReqToCallback: true
		},
		async (email,password,done)=>{

		const user = await User.findOne({where:{email: email}})

		console.log(email,password)

		if(!user){
			return done(null,false,{message:'No user with this email'})
		}

		bcrypt.compare(password,user.password).then(match=>{
			if(match){
				return done(null,user,{ message: 'Logged in succesfully' });
			}
			return done(null,false,{message:'Wrong username or password'});
		}).catch(err=>{
			return done(null,false,{message:'Something went wrong'})
		})
	})

		)

	passport.serializeUser((user, done) => {

        done(null, user.id)
    })

      passport.deserializeUser(async (id, done) => {
        const user = await User.findByPk(id)
        console.log('*******************'+user+'*****************')
        if(user){
        	done(null, user)
        }
        else{
        	done(null,false)
        }
            
	        
    })
	
}

module.exports=init