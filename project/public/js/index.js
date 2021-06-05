// const axios = require('axios')

// function update(product){

// 	axios.post('/updateCart',product).then(res=>{
// 		console.log(res);
// 	})
// }

function updateCart(product){


	fetch('/updateCart',{
	method:'POST',
	headers: {'Content-Type':'application/json'},
	body:JSON.stringify({product:product})
}).then(res => res.json()).then(data => console.log(data))


	// update(product)
	// fetch('/updateCart').then(res => res.json()
	// 	).then(data => console.log(data))
	// console.log(pr)

}

    // $(document).ready(function() {
       
    //     location.reload();
    // });

   


