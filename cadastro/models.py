from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Campus(models.Model):
    campus =  models.CharField('Campus', max_length=70)


    def __str__(self):
        return self.campus


class Curso(models.Model):
    curso =  models.CharField('Curso', max_length=100)


    def __str__(self):
        return self.curso

class Disciplina(models.Model):
    disciplina =  models.CharField('Disciplina', max_length=70)
    codigo = models.CharField('Codigo', max_length=100, null=False)



    def __str__(self):
        return self.disciplina


class Aluno(models.Model):

    usuario = models.OneToOneField(User, on_delete=models.PROTECT)
    matricula = models.CharField(max_length=255, null=False)
    disciplina = models.ManyToManyField(Disciplina, verbose_name =("Disciplina"),
                                  blank=True)
    curso = models.ForeignKey(Curso, verbose_name=("Curso"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)


    campus = models.ForeignKey(Campus, verbose_name=("Campus"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)
    anoingresso = models.CharField('Ano ingresso', max_length=20)

    
    def __unicode__(self):
        return self.usuario


class Professor(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.PROTECT)
    # Adicionando os campos
    cracha = models.CharField(max_length=255, null=False)
    disciplina = models.ManyToManyField(Disciplina, verbose_name=("Disciplina"),
                                  blank=True)
    campus = models.ForeignKey(Campus, verbose_name=("Campus"),
                                 blank=True,
                                 null=True,
                                 on_delete=models.PROTECT)

    def __str__(self):
        return self.usuario






