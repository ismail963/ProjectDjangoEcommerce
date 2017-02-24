from django.db import models
from django.contrib.auth.models import User


class Categorie(models.Model):
    name = models.CharField(max_length=30)
    def __str__(self):
        return self.name

class Product(models.Model):
    owner = models.ForeignKey(User)
    name = models.CharField(max_length=255)
    images = models.TextField(null=True)
    description = models.TextField(null=True)
    price =  models.DecimalField(max_digits=12, decimal_places=2)
    adding_date = models.DateTimeField(auto_now_add=True)
    categorie = models.ForeignKey('Categorie')
    def __str__(self):
        return "Product {0}".format(self.name)


class Cart(models.Model):
	user = models.ForeignKey(User) 
	product = models.ForeignKey(Product) 
	quantity= models.IntegerField(default=1)
	buyed = models.BooleanField(default=False)
	adding_date=models.DateTimeField(auto_now_add=True)
	buyed_date=models.DateTimeField(auto_now=True)
	def __str__(self):
		return self.user

class RatingProduct(models.Model):
	product = models.ForeignKey(Product) 
	user = models.ForeignKey(User)
	like = models.IntegerField(default=0)
	def __str__(self):
		return self.product.name

class CommentProduct(models.Model):
	product = models.ForeignKey(Product) 
	user = models.ForeignKey(User)
	comment = models.TextField()
	adding_date=models.DateTimeField(auto_now_add=True)
	def __str__(self):
		return self.product.name