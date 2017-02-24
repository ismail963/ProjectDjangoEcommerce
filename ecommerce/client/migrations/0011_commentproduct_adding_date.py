# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0010_commentproduct'),
    ]

    operations = [
        migrations.AddField(
            model_name='commentproduct',
            name='adding_date',
            field=models.DateTimeField(default=datetime.datetime(2017, 2, 23, 21, 25, 17, 657234, tzinfo=utc), auto_now_add=True),
            preserve_default=False,
        ),
    ]
