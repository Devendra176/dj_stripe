# Generated by Django 3.1.7 on 2021-03-06 11:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payments", "0012_subscriptionlist_created"),
    ]

    operations = [
        migrations.AddField(
            model_name="productlist",
            name="product_description",
            field=models.CharField(max_length=500, null=True),
        ),
    ]
