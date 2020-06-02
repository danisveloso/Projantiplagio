from __future__ import unicode_literals
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _
from django.db import models
from quiz.models import Question


ANSWER_ORDER_OPTIONS = (
    ('content', _('Conteúdo')),
    ('random', _('Aleatório')),
    ('none', _('Nenhum'))
)


class MCQuestion(Question):

    answer_order = models.CharField(
        max_length=30, null=True, blank=True,
        choices=ANSWER_ORDER_OPTIONS,
        help_text=_("A ordem na qual as opções de resposta "
                    "multipla escolha são exibidas"
                    "para o usuário"),
        verbose_name=_("Ordem da resposta"))

    def check_if_correct(self, guess):
        answer = Answer.objects.get(id=guess)

        if answer.correct is True:
            return True
        else:
            return False

    def order_answers(self, queryset):
        if self.answer_order == 'content':
            return queryset.order_by('content')
        if self.answer_order == 'random':
            return queryset.order_by('?')
        if self.answer_order == 'none':
            return queryset.order_by()
        return queryset

    def get_answers(self, guess):
        return self.order_answers(Answer.objects.filter(question=self))

    def get_answers_list(self):
        return [(answer.id, answer.content) for answer in
                self.order_answers(Answer.objects.filter(question=self))]

    def answer_choice_to_string(self, guess):
        return Answer.objects.get(id=guess).content

    def check_similaridade(self, guess):
        return False

    def get_citacao(self, guess):
        return False

    def get_original_text(self):
        return False

    class Meta:
        verbose_name = _("Questão de múltipla escolha")
        verbose_name_plural = _("Questões de múltipla escolha")


@python_2_unicode_compatible
class Answer(models.Model):
    question = models.ForeignKey(MCQuestion, verbose_name=_("Questão"), on_delete=models.PROTECT)

    content = models.CharField(max_length=1000,
                               blank=False,
                               help_text=_("Digite o texto da resposta "
                                           "que você deseja exibir"),
                               verbose_name=_("Conteúdo"))

    correct = models.BooleanField(blank=False,
                                  default=False,
                                  help_text=_("Está é a resposta correta?"),
                                  verbose_name=_("Correta"))

    def __str__(self):
        return self.content

    class Meta:
        verbose_name = _("Resposta")
        verbose_name_plural = _("Respostas")
