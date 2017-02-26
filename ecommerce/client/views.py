from django.shortcuts import render, redirect, render_to_response
from .forms import signUpForm, cnxForm, updateAccountForm, contactUsForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse, JsonResponse, Http404
from django.contrib.auth.models import User, Group
from models import Categorie, Product, Cart, RatingProduct, CommentProduct
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.core.mail import send_mail
from django.template import RequestContext
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
		return redirect(signUp)

def cnx(request):
	form = cnxForm(request.POST or None)
	if form.is_valid():
		user = authenticate(username=form.cleaned_data["username"], password=form.cleaned_data["password"])
 		if user: 
			login(request, user)
			return redirect(home)

    	else:
    		return render(request, "login.html", {"form": form })

def signUp(request):
	form = signUpForm(request.POST or None)
	if form.is_valid():
		user = User.objects.create_user(username=form.cleaned_data["username"], password=form.cleaned_data["password"])
		user.first_name=form.cleaned_data["firstname"]
		user.last_name=form.cleaned_data["lastname"]
		user.email=form.cleaned_data["email"]
		user.groups.add(Group.objects.get(name="client"))
		user.save()
		user = authenticate(username=form.cleaned_data["username"], password=form.cleaned_data["password"])
 		if user: 
			login(request, user)
			return redirect(home)
	return render(request, "login.html", {"form": form })	

@login_required(login_url='/connextion/')
def logoutFromSite(request):
	logout(request)
	return redirect(home)

@login_required(login_url='/connextion/')
def account(request):
	form = updateAccountForm(request.POST or None)
	if form.is_valid():
		user = User.objects.get(id=request.user.id)
		user.first_name=form.cleaned_data["firstname"]
		user.last_name=form.cleaned_data["lastname"]
		user.email=form.cleaned_data["email"]
		user.save()
		return redirect(account)
	else:
		return render(request, "acount.html", { "form": form })

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
	try:
		product= Product.objects.get(id=id)
		product.images=product.images.split(";")
		buyed_by = Cart.objects.filter(product=product, buyed=True).count();
		return render(request, "detailProduct.html", { "product" : product, "buyedBy" : buyed_by })
	except Product.DoesNotExist:
		raise Http404

@login_required(login_url='/connextion/')
def getProduct(request):
	product= Product.objects.get(id=request.GET.get("id"))
	data = serializers.serialize('json', [product])
	return JsonResponse(data, safe=False)

@login_required(login_url='/connextion/')
def addToCart(request):
	if request.method == "GET":
		product = Product.objects.get(id= request.GET.get("id"), active=True)
		if Cart.objects.filter(user=request.user, product=product, buyed=False).count()>0:
			cart= Cart.objects.get(user=request.user, product=product, buyed=False)
			cart.quantity+=1
			cart.save()
		else:
			cart = Cart(user=request.user, product=product)
			cart.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def removeFromCart(request):
	cart= Cart.objects.get(id=request.GET.get("id"))
	cart.delete()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def updateCart(request):
	cart= Cart.objects.get(id=request.GET.get("id"))
	cart.quantity=request.GET.get("quantity")
	cart.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def buyCart(request):
	list= Cart.objects.filter(user=request.user, buyed=False)
	for l in list:
		l.buyed=True
		l.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def boughtCart(request):
	list= Cart.objects.filter(user=request.user, buyed=True)
	for l in list:
		l.product.images=l.product.images.split(";")
	return render(request, "boughtProduct.html", { "carts": list })

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
def productReview(request, id_product):
	product = Product.objects.get(id=id_product)
	list =RatingProduct.objects.filter(product=product)
	number=0
	for l in list:
		number+=l.like
	if list.count()>0:
		number=number//list.count()
	return HttpResponse(number)

@login_required(login_url='/connextion/')
def removeProduct(request):
	product = Product.objects.get(id=request.GET.get("id"))
	if product.owner==request.user:
		product.active=False
		product.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def updateProduct(request):
	product = Product.objects.get(id=request.GET.get("id"))
	if product.owner==request.user:
		product.name=request.GET.get("name")
		product.price=request.GET.get("price")
		product.description=request.GET.get("description")
		product.save()
	return HttpResponse("OK")

@login_required(login_url='/connextion/')
def comments(request):
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

@login_required(login_url='/connextion/')
def getProducts(request):
	products=""
	page=int(request.GET.get("page"))-1
	if request.GET.get("categorie"):
		categorie = Categorie.objects.get(id=request.GET.get("categorie"))
		products = Product.objects.filter(categorie=categorie, active=True).order_by('-id')[(page*25):((page+1)*25)]
	elif request.GET.get("myProduct"):
		products = Product.objects.filter(owner=request.user, active=True).order_by('-id')[(page*25):((page+1)*25)]
	else:
		products = Product.objects.filter(active=True).order_by('-id')[(page*25):((page+1)*25)]

	data = serializers.serialize('json', products)
	return JsonResponse(data, safe=False)

@login_required(login_url='/connextion/')
def getCart(request):
	list= Cart.objects.filter(user=request.user, buyed=False)
	data = serializers.serialize('json', list)
	return JsonResponse(data, safe=False)

@login_required(login_url='/connextion/')
def productsPage(request):
	categories = Categorie.objects.all()
	return render(request, "products.html", { "categories" : categories })

@login_required(login_url='/connextion/')
def myProductsPage(request):
	return render(request, "myProducts.html", {})

@login_required(login_url='/connextion/')
def cartPage(request):
	return render(request, "cart.html", {})

@login_required(login_url='/connextion/')
def contactUs(request):
	form = contactUsForm(request.POST or None)
	if form.is_valid():
		admin = User.objects.get(username='etudiant')
		message= "Sent By :"+request.user.username+"\n"
		message+= "Email :"+request.user.email+"\n"
		message+="To you By UStora...\n"
		message+=form.cleaned_data["message"]

		send_mail(
			form.cleaned_data["objet"],
			message,
			settings.EMAIL_HOST_USER,   
			[ admin.email ],
			fail_silently=True,
		)
		return redirect(home)
	else:
		return render(request, "contact-us.html", { "form": form })