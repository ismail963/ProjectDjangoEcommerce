# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0006_auto_20170223_0234'),
    ]

    operations = [
        migrations.RenameField(
            model_name='categorie',
            old_name='nom',
            new_name='name',
        ),
    ]
