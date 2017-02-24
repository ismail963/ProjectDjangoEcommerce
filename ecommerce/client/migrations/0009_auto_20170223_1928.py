# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0008_ratingproduct'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ratingproduct',
            name='dislike',
        ),
        migrations.AlterField(
            model_name='ratingproduct',
            name='like',
            field=models.IntegerField(default=0),
        ),
    ]
