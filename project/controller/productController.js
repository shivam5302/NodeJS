const sequelize = require('.././models/database/mysql')

function productController(){

	return {
		async index(req,res){
			const [results, metadata] = await sequelize.query("SELECT * FROM products");
			// console.log('************'+user+'*************')
			res.render('index',{products:results});
		},
		async productView(req,res){

			const [results, metadata] = await sequelize.query(`SELECT * FROM products WHERE productID=${req.params.id}`,);

			res.render('productView',{product:results});

		}

}
}

module.exports = productController;