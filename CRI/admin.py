from django.contrib import admin
from .models import *

admin.site.register(Utente)
admin.site.register(Farmaco)
admin.site.register(DoseOraFarmaco)
admin.site.register(Esame)
admin.site.register(Allergia)
admin.site.register(Interventi)
admin.site.register(Malattie)