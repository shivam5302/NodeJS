const Order = require('.././models/order')

function orderController(){


	return {

		store(req,res){
			const {address, mobile} = req.body
			
			
			if(!mobile || !address){
				// req.flash('error','All fields are required')
				return res.redirect('/cart')
			}

			let orderArr=[]

			for(let i in req.session.cart.items){

				console.log('------idx=>'+i+' name=>'+req.session.cart.items[i].item.productName)

				let dataValue={

					id:req.session.cart.items[i].item.productID,
					name:req.session.cart.items[i].item.productName

				}

				orderArr[i] = dataValue

			}

			console.log(orderArr)
			

			let data = {

				customerId:req.user.id,

				items:JSON.stringify(orderArr),
				phone:mobile,
				address

			}
			// res.send(data);
				Order.sync().then(() => {
			    // Table created
			    req.flash('success','Order placed Successfully')

			    Order.create(data);
			    res.redirect('/customers/orders')
			  }).catch(err=>{ 
			  	req.flash('error','Something Went Wrong')
			  	console.log('--------------Something wrong-----------')
			  	res.redirect('/viewCart')
			  	
			  });
			  
				
		},

		 async index(req,res){

			await Order.findOne({where:{customerId:req.user.id}}).then(val=>{
				res.render('order',{orders:val.items.split(",")})
			})
		}
	}

	}


module.exports = orderController;