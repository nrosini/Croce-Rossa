# Generated by Django 2.0.1 on 2018-09-11 11:08

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Utente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=50)),
                ('cognome', models.CharField(max_length=50)),
                ('data', models.DateTimeField(blank=True, null=True)),
                ('email', models.CharField(max_length=50)),
                ('provincia', models.CharField(max_length=50)),
                ('citta', models.CharField(max_length=50)),
                ('indirizzo', models.CharField(max_length=50)),
                ('cap', models.CharField(max_length=50)),
            ],
        ),
    ]