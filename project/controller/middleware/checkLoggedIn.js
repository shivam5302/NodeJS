function checkLoggedIn(req,res,next){
	// 	console.log('*******'+req.isAuthenticated()+'***********')
	if(!req.isAuthenticated()){
		
		return next()

	}

	return res.redirect('/')
	

}

module.exports = checkLoggedIn