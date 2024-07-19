function addToCart(pid,pname,pPrice) {
	let cart = localStorage.getItem("cart");
	if(cart == null) {
		let products = [];
		let product = {
			productId: pid,
			productName: pname, 
			productPrice: pPrice,
			productQuantity: 1
		};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		showToast("Item is added to cart");
	}
	else {
		let products = JSON.parse(cart);
		let oldProduct = products.find((item)=> item.productId == pid);
		
		if(oldProduct == null) {
			let product = { 
				productId: pid,
				productName: pname, 
				productPrice: pPrice,
				productQuantity: 1
			};
			products.push(product);
			localStorage.setItem("cart",JSON.stringify(products));
			showToast("Item is added to cart");
		}
		else {
			products.map((item)=>{
			if(item.productId == oldProduct.productId) {
				item.productQuantity = oldProduct.productQuantity+1;
			}
			});
			localStorage.setItem("cart",JSON.stringify(products));
			showToast(" Quantity is increased "+(oldProduct.productQuantity+1));
		}
	}
	updateCart();
}


function removeItem(pid) {
	let cartString = localStorage.getItem('cart');
	let cart = JSON.parse(cartString);
	
	let newCart = cart.filter((item)=> item.productId != pid);
	localStorage.setItem('cart',JSON.stringify(newCart));
	updateCart();
}




function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart == null || cart.length == 0) {
		console.log("cart is empty")
		document.querySelector(".cart-body").innerHTML = "<h2>No Item is added to the cart</h2>";
		document.querySelector(".checkout-btn").classList.add("disabled");
		document.querySelector(".cart-item").innerHTML = "( 0 )";
	}
	else {
		document.querySelector(".cart-item").innerHTML = `( ${cart.length} )`;
		
		let table = `
			<table class = 'table' >
				<thead class = 'thead-light'>
					<tr>
						<th> Item Name </th>
						<th> Price </th>
						<th> Quantity </th>
						<th> Total Price </th>
						<th> Action </th>
					</tr>
				</thead>
			`;
		
			
		let totalPrice = 0;
		cart.map((item)=>{
			table += `
				<tr>
					<td>${ item.productName }</td>
					<td> ${item.productPrice}  </td>
					<td> ${item.productQuantity} </td>
					<td> ${item.productQuantity * item.productPrice} </td>
					<td> <button onClick = " removeItem(${item.productId}) " class = 'btn btn-danger btn-sm'> Remove </button> </td>
				</tr>
			`;
			totalPrice += item.productPrice * item.productQuantity;
		});
			
		table = table + `<tr> <td colspan = '5'  class = 'text-end fw-bold me-5' > Total Price:  ${totalPrice} </td> </tr> </table>`
		let cartBody = document.getElementsByClassName("cart-body");
		console.log(cartBody);
		for(let i = 0; i < cartBody.length; i++) {
			cartBody[i].innerHTML = table;
		}
		document.querySelector(".checkout-btn").classList.remove("disabled");
	}
	
}

updateCart();

function showToast(mess) {
	console.log(mess);
   document.getElementById("toast").innerHTML = `${mess}`;
   document.getElementById("toast").classList.add("visible");
   setTimeout(()=>{
    document.getElementById("toast").classList.remove("visible");
   },2000)
}

function checkout() {
	window.location = "checkout.jsp";
}

