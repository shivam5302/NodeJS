
function cartController(){

	return{

		viewCart(req,res){
			res.render('cart');
		},
		updateCart(req,res){
			if(!req.session.cart){
				req.session.cart = {
					items:{},
					totalQty:0,
					totalPrice:0
				}
			}
			let cart = req.session.cart
			if(!cart.items[req.body.product.productID]){
				cart.items[req.body.product.productID]={
					item:req.body.product,
					qty:1,

				}
				cart.totalQty = cart.totalQty + 1
				cart.totalPrice = cart.totalPrice + req.body.product.productPrice
			}
			else{
				cart.items[req.body.product.productID].qty = cart.items[req.body.product.productID].qty + 1;
				cart.totalQty = cart.totalQty + 1;
				cart.totalPrice = cart.totalPrice + req.body.product.productPrice;
			}
			
			return res.json({totalQty:req.session.cart.totalQty})
		}

	}

}

module.exports = cartController;