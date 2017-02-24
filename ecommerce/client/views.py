from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User, Group
from models import Categorie, Product, Cart, RatingProduct, CommentProduct
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.decorators import login_required
import time

# Create your views here.
def home(request):
	if request.user.is_authenticated():
		last_products= Product.objects.all().order_by('-id')[:7]  
		for pr in last_products:
			pr.images=pr.images.split(";")
		context={
			"last_products" : last_products
		}
		return render(request, "home.html", context)
	else:
		return render(request, "login.html", {})

def cnx(request):
	if request.method == "POST":
		user = authenticate(username=request.POST.get("username"), password=request.POST.get("password"))
 		if user: 
			login(request, user)
			return redirect(home)

    	else:
    		return render(request, "login.html", {})

def signUp(request):
	if request.method == "POST":
		user = User.objects.create_user(username=request.POST.get("username"), password=request.POST.get("password"))
		user.firstname=request.POST.get("firstname")
		user.lastname=request.POST.get("lastname")
		user.groups.add(Group.objects.get(name="client"))
		user.save()
		user = authenticate(username=request.POST.get("username"), password=request.POST.get("password"))
 		if user: 
			login(request, user)
			return redirect(home)
    	else:
    		return render(request, "login.html", {})	

@login_required(login_url='/connextion/')
def logoutFromSite(request):
	logout(request)
	return redirect(home)

@login_required(login_url='/connextion/')
def addProduct(request):
	if request.method == "POST":
		if request.FILES['files']:
			files = request.FILES.getlist('files')
			all_files = ""
			fs = FileSystemStorage()
			for file in files:
				extension = "."+file.name.split(".")[1]
				name = request.POST.get("name")+str(int(round(time.time() * 1000)))+extension
				filename = fs.save(name, file)
				all_files+=filename+";";

		product= Product(name=request.POST.get("name"), price=request.POST.get("price"), description=request.POST.get("description"))
		product.categorie=Categorie.objects.get(id=request.POST.get("categorie"))
		product.owner=request.user
		product.images=all_files
		product.save()
		return redirect(addProduct)
	else:
		categories= Categorie.objects.all()
		return render(request, "newProduct.html", { "categories" : categories })

@login_required(login_url='/connextion/')
def detailProduct(request, id):
	product= Product.objects.get(id=id)
	product.images=product.images.split(";")
	return render(request, "detailProduct.html", { "product" : product })

@login_required(login_url='/connextion/')
def addToCart(request):
	if request.method == "GET":
		product = Product.objects.get(id= request.GET.get("id"))
		if Cart.objects.filter(user=request.user, product=product).count()>0:
			cart= Cart.objects.get(user=request.user, product=product)
			cart.quantity+=1
			cart.save()
		else:
			cart = Cart(user=request.user, product=product)
			cart.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def globalPrice(request):
	list= Cart.objects.filter(user=request.user, buyed=False)
	g_price=0
	for l in list:
		g_price+=(l.product.price*l.quantity)
	return HttpResponse(str(g_price))

@login_required(login_url='/connextion/')
def globalNumberProduct(request):
	list= Cart.objects.filter(user=request.user, buyed=False)
	number=0
	for l in list:
		number+=1
	return HttpResponse(str(number))

@login_required(login_url='/connextion/')
def ratingProduct(request, id_product, rating):
	product = Product.objects.get(id=id_product)
	if RatingProduct.objects.filter(user=request.user, product=product).count()>0:
		ratingObj = RatingProduct.objects.get(user=request.user, product=product)
		ratingObj.like=rating
		ratingObj.save()
	else:
		ratingObj= RatingProduct(user=request.user, product=product)
		ratingObj.like=rating
		ratingObj.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def ProductReview(request, id_product):
	product = Product.objects.get(id=id_product)
	list =RatingProduct.objects.filter(product=product)
	number=0
	for l in list:
		number+=l.like
	number=number//list.count()
	return HttpResponse(number)

@login_required(login_url='/connextion/')
def Comments(request):
	product = Product.objects.get(id=request.GET.get("id"))
	if request.GET.get("comments"):
		page=int(request.GET.get("comments"))-1
		list = CommentProduct.objects.filter(product=product).order_by('-id')[(page*5):((page+1)*5)]
		context="["
		for l in list:
			context+="{ \"id\" : \""+str(l.id)+"\", "
			context+="\"username\" : \""+l.user.username+"\", "
			context+="\"date\" : \""+l.adding_date.strftime("%Y-%m-%d %H:%M:%S") +"\", "
			context+="\"comment\" : \""+l.comment+"\" },"
		if list.count()>0:
			context=context[:-1]
		context+="]"
		return JsonResponse(context, safe=False)
	elif request.GET.get("add"):
		comment = CommentProduct(user=request.user, product=product, comment=request.GET.get("add"))
		comment.save()
		return HttpResponse("OK")

