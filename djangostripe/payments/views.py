from django.shortcuts import render,redirect
from django.views.generic import View
from django.conf import settings
from django.contrib.auth import authenticate,logout,login
# from django.contrib.auth.views import login
from django.http.response import  JsonResponse
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.contrib.auth.hashers import check_password,make_password
# Create your views here.
from .models import ProductList,CustomerList,SubscriptionList
from django.contrib.auth.models import User
from django.contrib import messages
from django.views.generic.base import TemplateView
from django.views.generic import ListView,DetailView
from django.views.generic.edit import CreateView,DeleteView,UpdateView
from .extra import (pay_method,cus_method,
	                subscription,subscription_delete,
	                Token_create,charge_payment,
	                Create_invoice_for_subscription,
	                Retrieve_invoice,
	                # pay_method_update,
	                pay_method_detach,
	                pay_method_attach,
	                )
from django.contrib.auth import update_session_auth_hash
import stripe
import datetime
from djstripe.models import *
stripe.api_key =settings.STRIPE_TEST_SECRET_KEY

class HomePageView(TemplateView):
    template_name = 'home.html'




class CardView(TemplateView):
	template_name='card.html'

	def post(self, request):
		card_email=request.POST['card_email']
		card_num = request.POST['card_num']
		exp_month = request.POST['cc_exp_mo']
		exp_year = request.POST['cc_exp_yr']
		amount_first=request.POST['amount']
		amount=int(amount_first)*100
		cvc = request.POST['cvc']
		token=Token_create(card_num,exp_month,exp_year,cvc)

		# try:
		customer_data =CustomerList.objects.filter(email=card_email)
		cus=CustomerList.objects.filter(email=card_email).first()
		
		if len(customer_data)==0:
			messages.error(request,"join with us")
			return redirect("create_user")
		else:
			# customer_data =CustomerList.objects.filter(email=card_email).first()
			charge=charge_payment(amount,token,card_email,amount_first)
			if charge['captured']==True:
				messages.success(request,"payment done of {}".format(amount_first))
				return redirect("payment-index")
			else:
				messages.success(request,"server issue")
				return redirect("payment-index")

	def get_context_data(self,*args,**kwargs):
		context = super(CardView,self).get_context_data(**kwargs)
		context['object_list']=ProductList.objects.filter(price_recurring="one_time")
		return context



class ProductView(ListView):
	model=Plan
	template_name='subs.html'
	paginate_by = 3

	def post(self,request):
		card_email=request.POST.get("card_email")
		reg_email=request.POST.get("reg_email")
		plan=request.POST.get("plan")
		customer=Customer.objects.filter(email=reg_email).first()
		if card_email == reg_email:
			try:
				cus_id=customer.id
				sub=subscription(cus_id,plan)
				Subscription.sync_from_stripe_data(sub)
				invoice=sub['latest_invoice']
				Invoice.sync_from_stripe_data(invoice)
				messages.success(request,"Subscription done for {}".format(plan))
				return redirect("home")
			except :
				messages.error(request,"please join with us first")
				return redirect("create_user")
		else:
			messages.error(request,"please enter register email")
			return redirect("payments-subscription")

	def get_context_data(self,*args,**kwargs):
		pk=self.request.user.pk
		context = super(ProductView,self).get_context_data(**kwargs)
		customer=Customer.objects.filter(subscriber_id=pk).first()
		# context['Product']=Product.objects.filter(active=True).all()
		context['customer_email']=customer.email
		return context

class SubscribeView(DetailView):
	model=User
	template_name='subscribe_list.html'

	def get_context_data(self,*args,**kwargs):
		pk=self.kwargs.get('pk')
		context = super(SubscribeView,self).get_context_data(**kwargs)
		customer=Customer.objects.filter(subscriber_id=pk).first()
		customer_id=customer.djstripe_id
		context['object_list']=Subscription.objects.filter(customer_id=customer_id)

		return context


class UserCreateView(CreateView):
	model=CustomerList
	fields='__all__'
	template_name='user/user_create.html'

	def post(self,request):
		username=request.POST.get("username")
		password=request.POST.get("password")
		email=request.POST.get("card_email")
		address=request.POST.get("user_address")
		phone=request.POST.get("user_phone")
		card_num = request.POST.get("card_num")
		exp_month = request.POST.get("cc_exp_mo")
		exp_year = request.POST.get("cc_exp_yr")
		cvc = request.POST.get("cvc")
		
		try:
			pay=pay_method(card_num,exp_month,exp_year,cvc,email,username,phone)
			if pay:
				try:
					user_data=User.objects.create_user(username=username,password=password,email=email)
					s=Customer.get_or_create(subscriber=user_data)
					pay=s[0].add_payment_method(pay['id'],s[0].id)
					messages.success(request,"with {}, username you joined with us".format(username))
					return redirect("home")
				except Exception as e:
					if e.args[0]==1062:
						msg=messages.error(request,"This username alredy taken")
						return redirect("create_user")
					else:
						pass
		except Exception as e:
			f=e.args[0]
			s=f.split(":")
			messages.error(request,s[0])
			return redirect("create_user")

class SinginView(TemplateView):
	template_name='user/signin.html'
	# success_url='payments-subscription'

	def post(self,request):
		username=request.POST.get("username")
		password=request.POST.get("password")
		user = authenticate(username=username, password=password)

		if user is not None:
			if user.is_staff==False:
				cutomer=CustomerList.objects.filter(user_id=user.id).first()
				login(request,user)
				
				return JsonResponse({'status':True,'url':'/subscription/'})
			else:
				login(request,user)
				return JsonResponse({'status':True,'url':'/products/admin/subscription-list/'})
		else:
			msg="Invalid credential"
			return JsonResponse({'status':False,'msg':msg})









class Delete_sub(View):
	success_url=reverse_lazy('subscription_users')

	def post(self,request,**kwargs):
		subscription_id=self.request.POST.get("id")
		try:
			subscription_cancel=subscription_delete(subscription_id)			
			if subscription_cancel['status']=='canceled':
				messages.success(request,"Subscription canceled")
				Subscription.sync_from_stripe_data(subscription_cancel)
				return JsonResponse({'status':True})
		except Exception as e:
			f=e.args[0]
			s=f.split(":")
			messages.error(request,s[0]+ " wait for update")
			return JsonResponse({'status':False})



class Edit_card(UpdateView):
	model=User
	template_name='user/edit_card.html'
	
	fields=[]

	def post(self,request,**kwargs):
		print(type(self.kwargs.get('pk')))
		pk=self.kwargs.get('pk')
		email=request.POST.get('card_email')
		user=User.objects.filter(pk=pk,email=email).first()
		password=request.POST.get('password')
		if user:
			if int(pk) == user.pk and check_password(password,user.password) and email==user.email:
				paymentmethod_id=request.POST.get('paymentmethod_id')
				cus_id=request.POST.get('cus_id')
				phone=request.POST.get('user_phone')
				username=user.username
				card_num=request.POST.get('card_num')
				cc_exp_mo=request.POST.get('cc_exp_mo')
				cc_exp_yr=request.POST.get('cc_exp_yr')
				cvc =request.POST.get('cvc')
# First detach the card etails-------------
				try:
					pay=pay_method(card_num,cc_exp_mo,cc_exp_yr,cvc,email,username, phone)
	# attach with the customer -------------------
					detach=pay_method_detach(paymentmethod_id)
					PaymentMethod.sync_from_stripe_data(detach)
	#delete old data from database------------
					PaymentMethod.objects.filter(id=paymentmethod_id).delete()
					
	# create new payment method ------------------
					
					attach=pay_method_attach(pay['id'],cus_id)
					PaymentMethod.sync_from_stripe_data(attach)
	#mofify customer payment id------------------------
					c=stripe.Customer.modify(cus_id,invoice_settings={"default_payment_method":pay['id'],})
					Customer.sync_from_stripe_data(c)

					messages.success(request,"Card updated succesfully")
					return redirect('payments-subscription')
				except Exception as e:
					f=e.args[0]
					s=f.split(":")
					messages.error(request,s[0])
					return redirect("payments-subscription")
		else:
			messages.error(request,"password does not matched")
			return redirect("payments-subscription")


	def get_context_data(self,*args,**kwargs):
		pk=self.kwargs.get('pk')
		context = super(Edit_card,self).get_context_data(**kwargs)
		customer=Customer.objects.filter(subscriber_id=pk).first()
		cus_id=customer.id
		context['cus_id']=cus_id
		customer_id=customer.djstripe_id
		pay_id=PaymentMethod.objects.filter(customer_id=customer_id).first()
		context['user_phone']=pay_id.billing_details['phone']
		context['PaymentMethod_id']=pay_id.id
		return context	



class update_profile(UpdateView):
	model=User
	template_name='user/edit_profile.html'
	fields=[]

	def post(self,request,**kwargs):
		pk=self.kwargs.get('pk')
		cus_id=request.POST.get('cus_id')
		pay_id=request.POST.get('PaymentMethod_id')		
		phone=request.POST.get("phone")
		email=request.POST.get('card_email')
		new_password=request.POST.get('new_password')
		old_password=request.POST.get('old_password')
		user=User.objects.filter(pk=pk).first()
		user_data=User.objects.filter(pk=pk)
		if new_password and old_password:
			if check_password(old_password,user.password):
				user.set_password(new_password)
				user.save()
				update_session_auth_hash(request,user)
			else:
				messages.error(request,"please enter correct old password")
				return JsonResponse({'status':False})


		if user:
			user_data.update(email=email)
			c=stripe.Customer.modify(cus_id,email=email)
			p=stripe.PaymentMethod.modify(pay_id,billing_details={"email": email,"phone": phone},)
			Customer.sync_from_stripe_data(c)
			PaymentMethod.sync_from_stripe_data(p)
			messages.success(request,"profile updated succesfully")
			return JsonResponse({'status':True})


	def get_context_data(self,*args,**kwargs):
		context = super(update_profile,self).get_context_data(**kwargs)
		pk=self.kwargs.get('pk')
		customer=Customer.objects.filter(subscriber_id=pk).first()
		context['customer_email']=customer.email
		cus_id=customer.id
		context['cus_id']=cus_id
		customer_id=customer.djstripe_id
		pay_id=PaymentMethod.objects.filter(customer_id=customer_id).first()
		print(pay_id)
		context['user_phone']=pay_id.billing_details['phone']
		context['PaymentMethod_id']=pay_id.id
		
		return context

def logout_view(request):
    logout(request)
    return redirect("/")