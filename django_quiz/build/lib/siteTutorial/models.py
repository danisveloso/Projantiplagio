from django.db import models

from django.utils.translation import ugettext_lazy as _
from django.utils.timezone import now

# Create your models here.

class Contato(models.Model):
    nome = models.CharField(max_length=100, blank=False)
    email = models.EmailField(blank=False)
    mensagem = models.TextField(blank=False)
    data = models.DateTimeField(auto_now_add=True,
                                 verbose_name=_("data envio"))
    
    def __str__(self):
        return self.nome
