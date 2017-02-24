function putMenuActive(){
	var url=window.location.href;
	var menu = document.getElementById("menu").getElementsByTagName("li");

	if(url.indexOf("product/new")!=-1) menu[4].className="active";
	else if(url.indexOf("product/")!=-1) menu[1].className="active";
	else menu[0].className="active";
}

function Cart(){

	this.url_globalPrice="";
	this.url_numberProduct="";

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
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) { 
				alert("Status: " + textStatus+" Error: " + errorThrown); 
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
				alert("Status: " + textStatus+" Error: " + errorThrown); 
			}		
		});
	};

}


function Product(){
	this.id;
	this.url_rating;
	this.url_comments;
	this.all_comments=[];
	this.comment_page=1;
	this.init= function(a,b,c) {
		this.id=a;
		this.url_rating=b;
		this.url_comments=c;
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
				alert("Status: " + textStatus+" Error: " + errorThrown); 
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
				alert("Status: " + textStatus+" Error: " + errorThrown); 
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
}

var c=new Cart();
var p= new Product();