# Generated by Django 2.0.1 on 2018-09-11 13:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CRI', '0002_utente_sesso'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='utente',
            name='data',
        ),
        migrations.AddField(
            model_name='utente',
            name='data_di_nascita',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='utente',
            name='cap',
            field=models.CharField(max_length=5),
        ),
        migrations.AlterField(
            model_name='utente',
            name='sesso',
            field=models.CharField(choices=[('0', '--scegli--'), ('MASCHIO', 'MASCHIO'), ('FEMMINA', 'FEMMINA')], default='0', max_length=50),
        ),
    ]