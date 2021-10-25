from django.shortcuts import render, redirect
from django.views.generic import View
from django.conf import settings
from django.contrib.auth import authenticate, logout, login
from django.http.response import  JsonResponse
# from django.contrib.auth.views import login
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
# Create your views here.
from payments.models import ProductList, CustomerList, SubscriptionList
from djstripe.models import *
from django.contrib.auth.models import User
from django.contrib import messages
from django.views.generic.base import TemplateView
from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView,DeleteView
from payments.extra import (
    pay_method,
    cus_method,
    subscription,
    admin_add_product,
    product_price_add,
    product_price_add_one_time,
    admin_update_subscription,
    admin_plan_create,
    Retrieve_invoice,
)

# import stripe
# import datetime

# Create your views here.


class AdminSubscriptionView(ListView):
    model = Subscription
    template_name = "admin/admin_subscriber_list.html"


class AdminProductView(ListView):
    model = Plan
    template_name = "admin/product_list.html"


class AdminAddProductView(TemplateView):
    template_name = "admin/add_product_form.html"

    def post(self, request):
        print(request.POST)
        product_name = request.POST["product_name"]
        product_description = request.POST["product_description"]
        product_price = request.POST["product_price"]
        product_price_ = int(product_price) * 100
        amount = str(product_price_)

        product_type = request.POST["product_type"]
        if product_type == "recurring":
            recurring = request.POST["recurring_type"]
            product = admin_add_product(product_name, product_description)
            product_id=product['id']
            Product.sync_from_stripe_data(product)
            plan = admin_plan_create(amount,product_id,recurring)
            Plan.sync_from_stripe_data(plan)
            messages.success(request, "product add succesfully")
            return redirect("products:add_product_admin")
        # else:
        #     product = admin_add_product(product_name, product_description)
        #     Product.sync_from_stripe_data(product)
        #     product_id = product["id"]
        #     price = admin_plan_create(amount,product_id)
        #     Plan.sync_from_stripe_data(plan)
        #     price_id = price["id"]

            # messages.success(request, "product add succesfully")
            # return redirect("products:add_product_admin")

class AdminUpdateRecord(View):

    def post(self,request):
        subscription=Subscription.objects.all()
        if len(subscription)!=0:
            for id in subscription:
                subcription_id=id.id
                retrive_data=admin_update_subscription(subcription_id)
                Subscription.sync_from_stripe_data(retrive_data)
                invoice=retrive_data['latest_invoice']
                data=Retrieve_invoice(invoice)
                Invoice.sync_from_stripe_data(data)
            return JsonResponse({'status':True})
        return JsonResponse({'status':False})


class Admin_subscription_delete(DeleteView):
    success_url=reverse_lazy('products:admin_subscription_list')

    def get_object(self):
        id_=self.kwargs.get("pk")
        id=self.request.POST.get("id_sub")
        if id_==id:
            return get_object_or_404(Subscription,djstripe_id=id_)