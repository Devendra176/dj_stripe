# Generated by Django 3.1.7 on 2021-03-05 09:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payments", "0004_customerlist"),
    ]

    operations = [
        migrations.AddField(
            model_name="customerlist",
            name="payment_method",
            field=models.CharField(max_length=200, null=True),
        ),
    ]
