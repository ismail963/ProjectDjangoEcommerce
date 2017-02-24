from django.contrib import admin
from models import Categorie, Product, Cart, RatingProduct, CommentProduct
# Register your models here.
admin.site.register(Categorie)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(RatingProduct)
admin.site.register(CommentProduct)