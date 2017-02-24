# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Categorie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nom', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=255)),
                ('images', models.TextField()),
                ('price', models.DecimalField(max_digits=12, decimal_places=2)),
                ('adding_date', models.DateTimeField(auto_now_add=True)),
                ('categorie', models.ForeignKey(to='client.Categorie')),
                ('owner', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
