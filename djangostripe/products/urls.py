from django.urls import path
from django.conf.urls.static import static
from django.conf import settings

# from products import views
from products.views import AdminSubscriptionView, AdminAddProductView, AdminProductView,AdminUpdateRecord,Admin_subscription_delete

app_name = "products"
urlpatterns = [
    path(
        "admin/subscription-list/",
        AdminSubscriptionView.as_view(),
        name="admin_subscription_list",
    ),
    path(
        "admin/product-list/", AdminAddProductView.as_view(), name="add_product_admin"
    ),
    path("admin/product/", AdminProductView.as_view(), name="admin_product_list"),
    path("admin/update/subscription/", AdminUpdateRecord.as_view(), name="admin_update_subcription_list"),
    path("<pk>/admin/update/subscription/", Admin_subscription_delete.as_view(), name="admin_delete_subcription_list"),
] 