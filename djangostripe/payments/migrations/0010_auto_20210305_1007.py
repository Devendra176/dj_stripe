# Generated by Django 3.1.7 on 2021-03-05 10:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("payments", "0009_auto_20210305_1005"),
    ]

    operations = [
        migrations.AlterField(
            model_name="customerlist",
            name="phone",
            field=models.CharField(max_length=12),
        ),
    ]
