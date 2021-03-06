from __future__ import unicode_literals
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _
from django.db import models
from quiz.models import Question


class TF_Question(Question):
    correct = models.BooleanField(blank=False,
                                  default=False,
                                  help_text=_("Marque esta opção se a pergunta"
                                              "é Verdadeira. Deixe em branco para"
                                              " falso."),
                                  verbose_name=_("Correta"))

    def check_if_correct(self, guess):
        if guess == "True":
            guess_bool = True
        elif guess == "False":
            guess_bool = False
        else:
            return False

        if guess_bool == self.correct:
            return True
        else:
            return False

    def get_answers(self, guess):
        return [{'correct': self.check_if_correct("True"),
                 'content': 'Verdadeiro'},
                {'correct': self.check_if_correct("False"),
                 'content': 'Falso'}]

    def get_answers_list(self):
        return [(True, 'Verdadeiro'), (False, 'Falso')]

    def answer_choice_to_string(self, guess):
        return str(guess)

    def check_similaridade(self, guess):
        return False

    def get_citacao(self, guess):
        return False

    def get_original_text(self):
        return False

    class Meta:
        verbose_name = _("Questão Verdadeiro/Falso")
        verbose_name_plural = _("Questões Verdadeiro/Falso")
        ordering = ['category']
