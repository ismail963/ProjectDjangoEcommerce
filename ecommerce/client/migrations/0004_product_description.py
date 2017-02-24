# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0003_auto_20170223_0109'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='description',
            field=models.TextField(null=True),
        ),
    ]
