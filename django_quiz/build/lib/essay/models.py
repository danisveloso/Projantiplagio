from __future__ import unicode_literals
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _
from django.db import models
from quiz.models import Question
import nltk

OPTIONS_CITATION = (
    ('direta', _('Citação direta')),
    ('indireta', _('Citação indireta')),
    ('resumo', _('Resumo'))
)

class ReferenciaManager(models.Manager):

    def new_referencia(self, originaltext):
        new_referencia = self.create(referencia=re.sub('\s+', '-', referencia)
                                   .lower())

        new_referencia.save()
        return new_referencia

@python_2_unicode_compatible
class Referencia(models.Model):
    referencia = models.TextField(max_length=1000,
                               blank=False,
                               help_text=_("Digite a referência correta para o texto"),
                               verbose_name=_("Referência"))
    
    objects = ReferenciaManager()

    def __str__(self):
        return self.referencia



@python_2_unicode_compatible
class Essay_Question(Question):
    tipo_citacao = models.CharField(
        max_length=30, blank=False, null=True,
        choices=OPTIONS_CITATION,
        help_text=_("Escolha qual tipo de citação o aluno terá que fazer nesta questão"),
        verbose_name=_("tipo de citação"))
    original_text = models.TextField(
        verbose_name=_("Texto original"),
        help_text=_("Tamanho máximo do texto 1000 caracteres"),
        max_length=1000, blank=False, null=True, 
        unique=True)
    referencia = models.ForeignKey(
        Referencia, blank=False, 
        verbose_name=_("Referência"), on_delete=models.PROTECT)
    
    citacao1 = models.CharField(max_length=1000, 
                               blank=False, null=True,
                               help_text=_("Digite como é a citação correta para a pergunta. Exemplo: Autor (ano)"),
                               verbose_name=_("Citação"))
    citacao2 = models.CharField(max_length=1000, 
                               blank=False, null=True,
                               help_text=_("Digite como é a citação correta para a pergunta. Exemplo: (AUTOR, ANO)"),
                               verbose_name=_("Citação"))

    def check_if_correct(self, guess):
        parafrase = guess
        text = str(self.original_text)        

        # Convert list to string
        str1= ''.join(text)
        str2= ''.join(parafrase)

        #split the string
        sent_text1=str1.split('.')
        sent_text2=str2.split('.')

        #create a for loop that compares two lists
        final_list=[]
        for z in sent_text1:
            for y in sent_text2:
                if z == y:
                    final_list.append(z)
            
        if not final_list:
            return True
        else:
            return False

    def get_answers(self):
        return self.content

    def get_answers_list(self):
        return False

    def answer_choice_to_string(self, guess):
        return str(guess)

    def __str__(self):
        return self.content

    class Meta:
        verbose_name = _("Questão dissertativa")
        verbose_name_plural = _("Questões dissertativas")





