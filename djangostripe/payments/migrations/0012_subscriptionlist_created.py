# Generated by Django 3.1.7 on 2021-03-06 07:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payments", "0011_subscriptionlist"),
    ]

    operations = [
        migrations.AddField(
            model_name="subscriptionlist",
            name="created",
            field=models.CharField(max_length=200, null=True),
        ),
    ]
