#from django.contrib.auth.models import User, Group
from CRI.models import Utente, Farmaco
from rest_framework import serializers


'''
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')
'''

class UtenteSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Utente
        fields = ('id', 'nome', 'cognome', 'sesso', 'data_di_nascita', 'email', 'provincia', 'citta', 'indirizzo', 'cap', 'password', 'passwordConfirm')

class FarmacoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Farmaco
        fields = ('id', 'utente_id', 'nome', 'principio')