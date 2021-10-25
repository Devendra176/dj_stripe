import stripe
from django.conf import settings

stripe.api_key = settings.STRIPE_TEST_SECRET_KEY


def pay_method(card_num,exp_month, exp_year, cvc, email, username, phone):
    pay_method = stripe.PaymentMethod.create(
        type="card",
        card={
            "number": card_num,
            "exp_month": exp_month,
            "exp_year": exp_year,
            "cvc": cvc,
        },
        billing_details={"email": email, "name": username, "phone": phone},
    )
    return pay_method


def pay_method_detach(pay_id):
    detach=stripe.PaymentMethod.detach(pay_id)
    return detach

def pay_method_attach(pay_id,cus_id):
    attach=stripe.PaymentMethod.attach(pay_id,
                                    customer=cus_id,
                                )
    return attach
# def pay_method_update(pay_id,card_num,exp_month, exp_year,cvc):
#     pay_method = stripe.PaymentMethod.modify(pay_id,
#         metadata={"updated":"yes"},
#         card={
#             "number": card_num,
#             "exp_month": exp_month,
#             "exp_year": exp_year,
#             "cvc": cvc,
#         },
#     )
#     return pay_method

def cus_method(card_email, pay_id, username, phone):
    cus_id = stripe.Customer.create(
        name=username,
        phone=phone,
        email=card_email,
        payment_method=pay_id,
        invoice_settings={"default_payment_method": pay_id},
    )
    return cus_id


def subscription(cus_id, price_id):
    subs = stripe.Subscription.create(
        customer=cus_id,
        items=[
            {"price": price_id},
        ],
        
        expand=['latest_invoice.payment_intent'],
    )
    return subs


def admin_add_product(name, description):
    product = stripe.Product.create(name=name, description=description)

    return product


def product_price_add(amount, recurring_period, product_id):
    unit_amount = int(amount)
    product_price = stripe.Price.create(
        billing_scheme="per_unit",
        unit_amount=unit_amount,
        currency="inr",
        recurring={"interval": recurring_period},
        product=product_id,
    )

    return product_price


def product_price_add_one_time(amount, product_id):
    unit_amount = int(amount)
    product_price = stripe.Price.create(
        billing_scheme="per_unit",
        unit_amount=unit_amount,
        currency="inr",
        product=product_id,
    )

    return product_price


def subscription_delete(subscription_id):
    delete = stripe.Subscription.delete(subscription_id)
    return delete


def Token_create(card_num, exp_month, exp_year, cvc):
    token = stripe.Token.create(
        card={
            "number": card_num,
            "exp_month": int(exp_month),
            "exp_year": int(exp_year),
            "cvc": cvc,
        },
    )
    return token


def charge_payment(amount, token, card_email, amount_first):
    charge = stripe.Charge.create(
        amount=amount,
        source=token,
        currency="INR",
        receipt_email=card_email,
        description="Payment done of {}".format(amount_first),
    )
    return charge

def admin_update_subscription(subscription_id):
    retrive_data=stripe.Subscription.retrieve(subscription_id)
    return retrive_data




def admin_plan_create(amount,product_id,interval=None):
    unit_amount = int(amount)
    if interval is None:
        interval="one_time"

    plan=stripe.Plan.create(

      amount=amount,
      currency="inr",
      interval=interval,
      product=product_id,
    )
    return plan

def Create_invoice_for_subscription(customer_id):
    invoice=stripe.Invoice.create(
            customer=customer_id,
            )
    return invoice

def Retrieve_invoice(invoice_id):
    data=stripe.Invoice.retrieve(invoice_id)
    return data