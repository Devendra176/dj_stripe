# Generated by Django 3.1.7 on 2021-03-08 09:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("payments", "0014_auto_20210308_0837"),
    ]

    operations = [
        migrations.RenameField(
            model_name="subscriptionlist",
            old_name="customer",
            new_name="customer_id",
        ),
        migrations.RenameField(
            model_name="subscriptionlist",
            old_name="price",
            new_name="price_id",
        ),
    ]
