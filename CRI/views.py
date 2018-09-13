from django.shortcuts import render

#from django.contrib.auth.models import User, Group
from CRI.models import Utente, Farmaco

from rest_framework import viewsets
from CRI.serializers import UtenteSerializer, FarmacoSerializer#, GroupSerializer

'''
class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
'''

class UtenteViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Utente.objects.all().order_by('id')
    serializer_class = UtenteSerializer

class FarmacoViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Farmaco.objects.all().order_by('id')
    serializer_class = FarmacoSerializer