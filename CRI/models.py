from django.db import models
from django.utils import timezone
from django import forms
#from  .forms import FormUtente



class Utente(models.Model):

    SEX_CHOICES = (
        ('0', '--scegli--'),
        ('MASCHIO', 'MASCHIO'),
        ('FEMMINA', 'FEMMINA'),
        ('ALTRO', 'Si, Grazie'),
    )

    id = int
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)

    sesso = models.CharField(max_length=50, choices=SEX_CHOICES, default='0')

    data_di_nascita= models.DateField(blank=True, null=True)

    email = models.CharField(max_length=50)
    provincia = models.CharField(max_length=50)
    citta = models.CharField(max_length=50)
    indirizzo = models.CharField(max_length=50)
    cap = models.CharField(max_length=5)

    password = models.CharField(max_length=50, default='')
    passwordConfirm = models.CharField(max_length=50, default='')

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome

#-----------------------------------------------------------------------------------------------------------------------

class Farmaco(models.Model):

    id = int
    utente_id = int

    nome = models.CharField(max_length=50)
    principio = models.CharField(max_length=50)

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome

#-----------------------------------------------------------------------------------------------------------------------

class DoseOraFarmaco(models.Model):

    DAY_CHOICES = (
        ('0', '--scegli--'),
        ('1', 'Lunedì'),
        ('2', 'Martedì'),
        ('3', 'Mercoledì'),
        ('4', 'Giovedì'),
        ('5', 'Venerdì'),
        ('6', 'Sabato'),
        ('7', 'Domenica'),
    )

    DOSE_CHOICES = (
        ('0', '--scegli--'),
        ('mg', 'mg'),
        ('ml', 'ml'),
        ('cucchiai', 'cucchiai'),
        ('compresse', 'compresse'),
        ('U.I.', 'U.I.'),
    )

    id = int
    farmaco_id = int

    giorno = models.CharField(max_length=50, choices=DAY_CHOICES, default='0')
    ora = models.TimeField(blank=True, null=True)
    dose_int = models.CharField(max_length=50)
    dose_str = models.CharField(max_length=10, choices=DOSE_CHOICES, default='0')

    def publish(self):
        self.save()

    def __str__(self):
        return self.giorno

#-----------------------------------------------------------------------------------------------------------------------

class Esame(models.Model):

    id = int
    User_id = int

    nome = models.CharField(max_length=50)
    ora = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome

#-----------------------------------------------------------------------------------------------------------------------

class Allergia(models.Model):

    ALLERGIA_CHOICES = (
        ('0', 'Nessuna'),
        ('Arachidi', 'Arachidi'),
        ('Polline', 'Polline'),
        ('Lattosio', 'Lattosio'),
        ('Graminacee', 'Graminacee'),
        ('Acaro', 'Acaro'),
    )

    id = int
    User_id = int
    nome = models.CharField(max_length=50, choices=ALLERGIA_CHOICES, default='0')

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome

#-----------------------------------------------------------------------------------------------------------------------

class Interventi(models.Model):

    INTERVENTI_CHOICES = (
        ('0', 'Nessuna'),
        ('Appendicite', 'Appendicite'),
        ('Trapianto', 'Trapianto'),
        ('Intervento al osso', 'Intervento al osso'),
        ('Piede monco', 'Piede monco'),
        ('Gianni Mario', 'Gianni Mario'),
    )

    id = int
    User_id = int
    nome = models.CharField(max_length=50, choices=INTERVENTI_CHOICES, default='0')

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome

#-----------------------------------------------------------------------------------------------------------------------

class Malattie(models.Model):

    MALATTIE_CHOICES = (
        ('0', 'Nessuna'),
        ('Epatite', 'Epatite'),
        ('Sifilide', 'Sifilide'),
        ('Gonorrea', 'Gonorrea'),
        ('AIDS', 'AIDS'),
        ('MARQUEZ', 'MARQUEZ'),
    )

    id = int
    User_id = int
    nome = models.CharField(max_length=50, choices=MALATTIE_CHOICES, default='0')

    def publish(self):
        self.save()

    def __str__(self):
        return self.nome