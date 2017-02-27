"""ecommerce URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from . import views

urlpatterns = [
	url(r'^$', views.home, name='home'),
	url(r'^connextion/', views.cnx, name='cnx'),
	url(r'^signup/', views.signUp, name='signUp'),
	url(r'^logout$', views.logoutFromSite, name='logoutFromSite'),

	url(r'^product/new', 'client.views.addProduct', name='addProduct'),
	url(r'^product/select', 'client.views.getProduct', name='getProduct'),
	url(r'^product/(\d+)$', 'client.views.detailProduct' , name='detailProduct'),
	url(r'^product/rating/(\d+)/(\d+)$', 'client.views.ratingProduct' , name='ratingProduct'),
	url(r'^product/review/(\d+)$', 'client.views.productReview' , name='ProductReview'),
	url(r'^product/comments$', 'client.views.comments', name='Comments'),
	url(r'^product/getter$', 'client.views.getProducts', name='getterProducts'),
	url(r'^product/list$', 'client.views.productsPage', name='products'),
	url(r'^product/my$', 'client.views.myProductsPage', name='myProducts'),
	url(r'^product/remove$', 'client.views.removeProduct', name='rmProduct'),
	url(r'^product/modify$', 'client.views.updateProduct', name='modifyProduct'),

	url(r'^cart/all', 'client.views.cartPage', name='cart'),
	url(r'^cart/bought', 'client.views.boughtCart', name='boughtCart'),
	url(r'^cart/get', 'client.views.getCart', name='getterCart'),
	url(r'^cart/new', 'client.views.addToCart', name='addToCart'),
	url(r'^cart/remove', 'client.views.removeFromCart', name='rmFromCart'),
	url(r'^cart/update', 'client.views.updateCart', name='updateCart'),
	url(r'^cart/buy', 'client.views.buyCart', name='buy'),
	url(r'^cart/globalPrice', 'client.views.globalPrice', name='globalPrice'),
	url(r'^cart/globalNumber', 'client.views.globalNumberProduct', name='globalNumberProduct'),

	url(r'^contact/', 'client.views.contactUs', name='contactUs'),
	url(r'^myaccount/', 'client.views.account', name='acount'),


    url(r'^admin/', include(admin.site.urls)),
]
