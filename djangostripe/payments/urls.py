from django.urls import path
from django.conf.urls.static import static
from django.contrib.auth.decorators import login_required
from django.conf import settings
from . import views
from .views import (
    ProductView,
    CardView,
    UserCreateView,
    SubscribeView,
    SinginView,
    Delete_sub,
    Edit_card,
    update_profile,
)

# aap_name='payments'
urlpatterns = [
    path("", views.HomePageView.as_view(), name="home"),
    path("payment/", login_required(CardView.as_view()), name="payment-index"),
    path("<pk>/subscribe-user/", login_required(SubscribeView.as_view()), name="subscription_users"),
    path("subscription/", login_required(ProductView.as_view()), name="payments-subscription"),
    path("join_stripe/", UserCreateView.as_view(), name="create_user"),
    path("signin/", SinginView.as_view(), name="signin_user"),
    path("logout/", views.logout_view, name="logout"),
    path("cancel-subscription/", login_required(Delete_sub.as_view()), name="delete_sub"),
    path("<pk>/edit-card/", login_required(Edit_card.as_view()), name="edit_card_details"),
    path("<pk>/edit-profile/", login_required(update_profile.as_view()), name="edit_profile"),
]