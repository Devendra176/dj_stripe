from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class CustomerList(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    customer_id = models.CharField(max_length=200, null=True)
    payment_method = models.CharField(max_length=200, null=True)
    email = models.CharField(max_length=200, unique=True)
    address = models.CharField(max_length=500)
    token_id = models.CharField(max_length=200, null=True)
    phone = models.CharField(max_length=12)


class ProductList(models.Model):
    product_id = models.CharField(max_length=200)
    product_name = models.CharField(max_length=200)
    product_description = models.CharField(max_length=500, null=True)
    price_id = models.CharField(max_length=200, null=True)
    price = models.IntegerField(null=True)
    price_recurring = models.CharField(max_length=200, null=True)


class SubscriptionList(models.Model):
    customer = models.ForeignKey(CustomerList, on_delete=models.DO_NOTHING, null=True)
    price = models.ForeignKey(ProductList, on_delete=models.DO_NOTHING, null=True)
    subscription_id = models.CharField(max_length=200)
    created = models.CharField(max_length=200, null=True)
