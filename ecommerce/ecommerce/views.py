from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth.models import User, Group
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import authenticate, login, logout
from client.models import Categorie, Product, Cart, RatingProduct, CommentProduct
from django.contrib.auth.decorators import login_required
from .forms import signUpForm, cnxForm

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
		return redirect(cnx)

def cnx(request):
	form = cnxForm(request.POST or None)
	if form.is_valid():
		user = authenticate(username=form.cleaned_data["username"], password=form.cleaned_data["password"])
 		if user: 
			login(request, user)
			return redirect(home)
		else:
			return render(request, "login.html", {"ERROR": "Login faild" })
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