from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _
from django.conf import settings


# Create your models here.


class Campus(models.Model):
    campus =  models.CharField('Campus', max_length=70)


    def __str__(self):
        return self.campus

    class Meta:
        verbose_name = _("Campus")
        verbose_name_plural = _("Campus")


class Curso(models.Model):
    curso =  models.CharField('Curso', max_length=100)


    def __str__(self):
        return self.curso

class Disciplina(models.Model):
    disciplina =  models.CharField('Disciplina', max_length=70)
    codigo = models.CharField('Codigo', max_length=100, null=False)



    def __str__(self):
        return self.disciplina


class Turma(models.Model):
    turma =  models.CharField('Turma', max_length=70)
    periodo = models.CharField('periodo', max_length=50, null=False)
    ano = models.CharField('ano', max_length=50, null=False)
    curso = models.ForeignKey(Curso, verbose_name=("Curso"),
                                 blank=True,
                                 null=True,
                                 related_name='turmas',
                                 on_delete=models.PROTECT)
    campus = models.ForeignKey(Campus, verbose_name=("Campus"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)

    def __str__(self):
        return self.turma


class Aluno(models.Model):
    usuario = models.ForeignKey(User, verbose_name=("Usuário"),
                                 blank=False,
                                 null=False,
                                 on_delete=models.CASCADE)
    nomecompleto = models.CharField(max_length=255, null=False)                             
    matricula = models.CharField(max_length=255, null=False)
    disciplina = models.ManyToManyField(Disciplina, verbose_name =("Disciplina"),
                                  blank=True)
   

    campus = models.ForeignKey(Campus, verbose_name=("Campus"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)
    turma = models.ForeignKey(Turma, verbose_name=("Turma"),
                                 related_name='aluno',
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)
    
    anoingresso = models.CharField('Ano ingresso', max_length=20)

    
    def __str__(self):
        return f'{self.usuario}, {self.matricula}'

    class Meta:
        verbose_name = _("Aluno")
        verbose_name_plural = _("Alunos")


class Professor(models.Model):
    usuario = models.ForeignKey(User, verbose_name=("Usuário"),
                                 blank=False,
                                 null=False,
                                 on_delete=models.CASCADE)
    nomecompleto = models.CharField(max_length=255, null=False)
    cracha = models.CharField(max_length=255, null=False)
    disciplina = models.ManyToManyField(Disciplina, verbose_name=("Disciplina"),
                                  blank=True)
    campus = models.ForeignKey(Campus, verbose_name=("Campus"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)

    def __str__(self):
        return f'{self.cracha}, {self.usuario}'

    class Meta:
        verbose_name = _("Professor")
        verbose_name_plural = _("Professores")






