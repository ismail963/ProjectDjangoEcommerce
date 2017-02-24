# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('client', '0005_product_number'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quantity', models.IntegerField(default=1)),
                ('buyed', models.BooleanField(default=False)),
                ('adding_date', models.DateTimeField(auto_now_add=True)),
                ('buyed_date', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='product',
            name='number',
        ),
        migrations.AddField(
            model_name='cart',
            name='product',
            field=models.ForeignKey(to='client.Product'),
        ),
        migrations.AddField(
            model_name='cart',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
    ]
