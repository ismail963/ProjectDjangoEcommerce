# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0002_auto_20170223_0046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='owner',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
        ),
    ]
