# Generated by Django 2.0.1 on 2018-09-12 12:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CRI', '0006_auto_20180912_1249'),
    ]

    operations = [
        migrations.CreateModel(
            name='Allergia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(choices=[('0', 'Nessuna'), ('Arachidi', 'Arachidi'), ('Polline', 'Polline'), ('Lattosio', 'Lattosio'), ('Graminacee', 'Graminacee'), ('Acaro', 'Acaro')], default='0', max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='DoseOraFarmaco',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('giorno', models.CharField(choices=[('0', '--scegli--'), ('1', 'Lunedì'), ('2', 'Martedì'), ('3', 'Mercoledì'), ('4', 'Giovedì'), ('5', 'Venerdì'), ('6', 'Sabato'), ('7', 'Domenica')], default='0', max_length=50)),
                ('ora', models.TimeField(blank=True, null=True)),
                ('dose_int', models.CharField(max_length=50)),
                ('dose_str', models.CharField(choices=[('0', '--scegli--'), ('mg', 'mg'), ('ml', 'ml'), ('cucchiai', 'cucchiai'), ('compresse', 'compresse'), ('U.I.', 'U.I.')], default='0', max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Esame',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=50)),
                ('ora', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Interventi',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(choices=[('0', 'Nessuna'), ('Appendicite', 'Appendicite'), ('Trapianto', 'Trapianto'), ('Intervento al osso', 'Intervento al osso'), ('Piede monco', 'Piede monco'), ('Gianni Mario', 'Gianni Mario')], default='0', max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Malattie',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(choices=[('0', 'Nessuna'), ('Epatite', 'Epatite'), ('Sifilide', 'Sifilide'), ('Gonorrea', 'Gonorrea'), ('AIDS', 'AIDS'), ('MARQUEZ', 'MARQUEZ')], default='0', max_length=50)),
            ],
        ),
    ]