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

urlpatterns = [
	url(r'^$', 'client.views.home', name='home'),
	url(r'^connextion/', 'client.views.cnx', name='cnx'),
	url(r'^signup/', 'client.views.signUp', name='signUp'),
	url(r'^logout$', 'client.views.logoutFromSite', name='logoutFromSite'),

	url(r'^product/new', 'client.views.addProduct', name='addProduct'),
	url(r'^product/(\d+)$', 'client.views.detailProduct' , name='detailProduct'),
	url(r'^product/rating/(\d+)/(\d+)$', 'client.views.ratingProduct' , name='ratingProduct'),
	url(r'^product/review/(\d+)$', 'client.views.ProductReview' , name='ProductReview'),
	url(r'^product/comments$', 'client.views.Comments' , name='Comments'),

	url(r'^cart/new', 'client.views.addToCart', name='addToCart'),
	url(r'^cart/globalPrice', 'client.views.globalPrice', name='globalPrice'),
	url(r'^cart/globalNumber', 'client.views.globalNumberProduct', name='globalNumberProduct'),

    url(r'^admin/', include(admin.site.urls)),
]
