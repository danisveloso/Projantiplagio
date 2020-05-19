from __future__ import unicode_literals
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _
from django.db import models
from quiz.models import Question

OPTIONS_CITATION = (
    ('direta', _('Citação direta')),
    ('indireta', _('Citação indireta')),
    ('resumo', _('Resumo'))
)

@python_2_unicode_compatible
class Essay_Question(Question):
    tipo_citacao = models.CharField(
        max_length=30, null=True, blank=True,
        choices=OPTIONS_CITATION,
        help_text=_("Escolha qual tipo de citação o aluno terá que fazer nesta questão"),
        verbose_name=_("tipo de citação"))
    citacao = models.TextField(max_length=1000,
                               blank=False,
                               help_text=_("Digite como é a citação correta para o texto"),
                               verbose_name=_("Citação"))
    
    referencia = models.TextField(max_length=1000,
                               blank=False,
                               help_text=_("Digite como é a referência correta para o texto"),
                               verbose_name=_("Referência"))
    

    def check_if_correct(self, guess):
        return False

    def get_answers(self):
        return False

    def get_answers_list(self):
        return False

    def answer_choice_to_string(self, guess):
        return str(guess)

    def __str__(self):
        return self.content

    class Meta:
        verbose_name = _("Questão dissertativa")
        verbose_name_plural = _("Questões dissertativas")



