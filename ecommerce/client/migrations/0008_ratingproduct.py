# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('client', '0007_auto_20170223_1556'),
    ]

    operations = [
        migrations.CreateModel(
            name='RatingProduct',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('like', models.BooleanField(default=False)),
                ('dislike', models.BooleanField(default=False)),
                ('product', models.ForeignKey(to='client.Product')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
