from django.contrib import admin
from .models import Contato
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.translation import ugettext_lazy as _



class ContatoAdmin(admin.ModelAdmin):
    search_fields = ('nome', )
    list_display = ('nome', 'email', 'data',)
    list_filter = ('nome', 'data',)

admin.site.register(Contato, ContatoAdmin)


