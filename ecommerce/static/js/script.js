function putMenuActive(){
	var url=window.location.href;
	var menu = document.getElementById("menu").getElementsByTagName("li");

	if(url.indexOf("product/new")!=-1) menu[3].className="active";
	else if(url.indexOf("product/my")!=-1) menu[2].className="active";
	else if(url.indexOf("product/")!=-1) menu[1].className="active";
	else if(url.indexOf("cart/")!=-1) menu[4].className="active";
	else menu[0].className="active";
}

function Cart(){

	this.url_globalPrice="";
	this.url_numberProduct="";
	this.url_cart="";
	this.url_rm_from_cart="";
	this.url_update_cart="";
	this.all_products=[];

	this.init=function (a,b){
		this.url_globalPrice=a;
		this.url_numberProduct=b;
	};

	this.addToCart=function (url){
		$('#loadModal').modal('show');
		var obj= this;
		$.ajax({
			url: ""+url,
			type: "GET",
			success: function (my_text) {
				if(my_text=="OK") {
					$('#loadModal').modal('hide');
						$('.bottom-right').notify({
					    	message: { text: 'Product added to your cart ' },
					    	fadeOut: { enabled: true, delay: 5000 },
					    	type : 'blackgloss'
					  	}).show();
					  	obj.getGobalPrice();
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Error: " + errorThrown); 
			}		
		});
	};

	this.getGobalPrice=function (){
		$.ajax({
			url: ""+this.url_globalPrice,
			type: "GET",
			success: function (my_text) {
				document.getElementById("cart_global_price").innerHTML="$"+my_text;
				document.getElementById("cart_icon").className="fa fa-shopping-cart";
				if(document.getElementById("cart.total")!=null){
					document.getElementById("cart.total").innerHTML="$"+my_text;
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" GobalPrice Error: " + errorThrown); 
			}		
		});
	};

	this.getGobalNumberProduct=function (){
		$.ajax({
			url: ""+this.url_numberProduct,
			type: "GET",
			success: function (my_text) {
				document.getElementById("cart_number_product").innerHTML=my_text;
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" GobalNumber Error: " + errorThrown); 
			}		
		});
	};

	this.getCart = function (){
		var obj=this;
		var products= document.getElementById("products");
		var plus= products.innerHTML;
		$.ajax({
			url: ""+this.url_cart,
			type: "GET",
			success: function (my_text) {		
				obj.all_products= JSON.parse(my_text);
				for(var i=0;i<obj.all_products.length;i++){
					p.getProduct(obj.all_products[i].fields.product, obj.all_products[i]);
				}
				setTimeout(function(){
					products.innerHTML="";
					for(var i=0;i<c.all_products.length;i++){
						var div= document.getElementById("example_product_tr").innerHTML;
						div=div.replace(/cart.id/g, c.all_products[i].pk);
						div=div.replace("product.id", c.all_products[i].fields.product);
						div=div.replace("product.qty", c.all_products[i].fields.quantity);
						div=div.replace("product.name", c.all_products[i].product.name);
						div=div.replace("product.price", c.all_products[i].product.price);
						div=div.replace("product.img", encodeURI(c.all_products[i].product.images.split(";")[0]));
						div=div.replace("/product/0", "/product/"+c.all_products[i].fields.product);
						div=div.replace("product.globalprice", (c.all_products[i].product.price*c.all_products[i].fields.quantity));
						products.innerHTML+=div;
					}
					products.innerHTML+=plus;
					document.getElementById("loading").style.display="none";
				}, 2000);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" GobalPrice Error: " + errorThrown); 
			}		
		});
	};

	this.removeProduct= function(tr, id){
		$.ajax({
			url: ""+this.url_rm_from_cart,
			data: "id="+id,
			type: "GET",
			success: function (my_text) {
				tr.remove();
				c.getGobalPrice();
				c.getGobalNumberProduct();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" GobalPrice Error: " + errorThrown); 
			}		
		});
	};

	this.updateCart= function(tr, id, value){
		var tds=tr.getElementsByTagName("td");
		if(!isNaN(value) && value>0){
			$.ajax({
				url: ""+this.url_update_cart,
				data: "id="+id+"&quantity="+value,
				type: "GET",
				success: function (my_text) {
					for(var i=0;i<c.all_products.length;i++){
						if(id==c.all_products[i].pk){
							c.all_products[i].fields.quantity=value;
							tds[5].getElementsByTagName("span")[0].innerHTML="$"+(c.all_products[i].product.price*c.all_products[i].fields.quantity);
							break;
						}
					}				
					c.getGobalPrice();
					c.getGobalNumberProduct();
					tds[5].style.backgroundColor="lightblue";
					setTimeout(function(){
						tds[5].style.backgroundColor="##598de9";
						setTimeout(function(){
							tds[5].style.backgroundColor="white";
						}, 100);
					}, 200);
					
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) { 
					alert("Status: " + textStatus+" GobalPrice Error: " + errorThrown); 
				}		
			});
		}
		else alert("ERROR: value is an number > 0");
	};

}

function Product(){
	this.id;
	this.url_rating;
	this.url_comments;
	this.url_products;
	this.url_product;
	this.rm_product;
	this.all_comments=[];
	this.products=[];
	this.comment_page=1;
	this.products_page=1;
	this.id_categorie=-1;
	this.getMyProducts=false;

	this.init= function(a,b,c,d,e) {
		this.id=a;
		this.url_rating=b;
		this.url_comments=c;
		this.url_products=d;
		this.rm_product=e;
	};

	this.setCategorie=function(id){
		this.id_categorie=id;
		this.products_page=1;
		this.products=[];
		document.getElementById("products").innerHTML="";
		this.getProducts();
	};

	this.getProducts = function(){
		var obj=this;
		productsHTML= document.getElementById("products");
		loading= document.getElementById("loading");
		loading.style.display="";
		data="";
		if(this.id_categorie!=-1)
			data="page="+this.products_page+"&categorie="+this.id_categorie;
		else if(this.getMyProducts)
			data="page="+this.products_page+"&myProduct=1";
		else
			data="page="+this.products_page;
		$.ajax({
			url: ""+this.url_products,
			data: data,
			type: "GET",
			success: function (my_text) {
				if(JSON.parse(my_text).length>0) {
					productsHTML.innerHTML="";
					obj.products=obj.products.concat(JSON.parse(my_text));
					for(var i=0;i<obj.products.length;i++){
						var div= document.getElementById("examble_product").innerHTML;
						div=div.replace("product.id", obj.products[i].pk);
						div=div.replace("product.id", obj.products[i].pk);
						div=div.replace("product.name", obj.products[i].fields.name);
						div=div.replace("product.price", obj.products[i].fields.price);
						div=div.replace("product.img", encodeURI(obj.products[i].fields.images.split(";")[0]));
						div=div.replace("/product/0", "/product/"+obj.products[i].pk);
						productsHTML.innerHTML+=div;
						loading.style.display="none";
					}
					obj.products_page++;
				}
				if(JSON.parse(my_text).length==0 || JSON.parse(my_text).length<25) {
					loading.style.display="none";
					document.getElementById("showmore").style.display="none";
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" getProducts Error: " + errorThrown); 
			}		
		});	
	};

	this.removeProduct= function(id, div){
		var obj=this;
		if(confirm("Are you sure you want to delete this product ?")){
			$.ajax({
				url: ""+this.rm_product,
				data: "id="+id,
				type: "GET",
				success: function (my_text) {
					div.innerHTML="Removed";
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) { 
					alert("Status: " + textStatus+" Error: " + errorThrown); 
				}		
			});
		}
	};

	this.showModifyProductModal= function(id){
		this.id=id;
		for(var i=0;i<this.products.length;i++){
			if(this.products[i].pk==this.id){
				document.getElementById("name").value=this.products[i].fields.name;
				document.getElementById("price").value=this.products[i].fields.price;
				document.getElementById("desc").value=this.products[i].fields.description;
				$('#modifyProductModal').modal('show');
				break;
			}
		}
	};

	this.modifyProduct=function(url) {
		var name=document.getElementById("name").value;
		var price= document.getElementById("price").value;
		var desc=document.getElementById("desc").value;
		var obj=this;
		if(name.length>0 && desc.length>0 && price>0){
			$('#modifyProductModal').modal('hide');
			$.ajax({
				url: ""+url,
				data: "id="+this.id+"&name="+name+"&price="+price+"&description="+desc,
				type: "GET",
				success: function (my_text) {
					obj.products_page=1;
					obj.products=[];
					document.getElementById("products").innerHTML="";
					obj.getProducts();	
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) { 
					alert("Status: " + textStatus+" Error: " + errorThrown); 
				}		
			});
		}
		else alert("Error: all fields are required !")

	};

	this.setRatingValue=function(url){
		var obj=this;
		$.ajax({
			url: ""+url,
			type: "GET",
			success: function (my_text) {
				obj.getRatingForProduct();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Error: " + errorThrown); 
			}		
		});
	};

	this.getRatingForProduct=function(){
		$.ajax({
			url: ""+this.url_rating,
			type: "GET",
			success: function (my_text) {
				var number= parseInt(my_text);
				var icons = document.getElementById("ProductReview").getElementsByTagName("i");
				for(var i=0;i<5;i++){
					icons[i].className="fa fa-star-o";
				}
				for(var i=1;i<=number;i++){
					if(i%2==0){
						icons[parseInt((i-1)/2)].className="fa fa-star";
					}
					else icons[parseInt((i-1)/2)].className="fa fa-star-half-o";
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Reviews Error: " + errorThrown); 
			}		
		});		
	};

	this.getCommentsProduct=function(){
		var obj=this;
		comments= document.getElementById("allcomments");
		$.ajax({
			url: ""+this.url_comments,
			data: "id="+this.id+"&comments="+this.comment_page,
			type: "GET",
			success: function (my_text) {
				if(JSON.parse(my_text).length>0) {
					comments.innerHTML="";
					obj.all_comments=obj.all_comments.concat(JSON.parse(my_text));
					for(var i=0;i<obj.all_comments.length;i++){
						var div= document.getElementById("example_comment").innerHTML;
						div=div.replace("username", obj.all_comments[i].username);
						div=div.replace("date", obj.all_comments[i].date);
						div=div.replace("comment", obj.all_comments[i].comment);
						comments.innerHTML+=div;
					}
					obj.comment_page++;
				}
				else document.getElementById("comment_showmore").style.display="none";
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Comments Error: " + errorThrown); 
			}		
		});
	};

	this.comment= function(){
		var obj=this;
		var comment = document.getElementById("addComment").value;
		if(comment!=""){
			$.ajax({
				url: ""+this.url_comments,
				data: "id="+this.id+"&add="+comment,
				type: "GET",
				success: function (my_text) {
					obj.comment_page=1;
					obj.all_comments =[];
					obj.getCommentsProduct();
					document.getElementById("addComment").value="";
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) { 
					alert("Status: " + textStatus+" Error: " + errorThrown); 
				}		
			});		
		}

	};

	this.getProduct= function (id, obj){
		$.ajax({
			url: ""+this.url_product,
			data: "id="+id,
			type: "GET",
			success: function (my_text) {
				obj.product=(JSON.parse(my_text))[0].fields;
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Error: " + errorThrown); 
			}		
		});		
	}
}

var c=new Cart();
var p= new Product();