from django.contrib import admin
from django.contrib.auth.models import User
from .models import Curso, Disciplina, Campus, Professor, Aluno, Turma
from django.contrib.admin.widgets import FilteredSelectMultiple
from django.utils.translation import ugettext_lazy as _



class CursoAdmin(admin.ModelAdmin):
    search_fields = ('curso',)
    list_display = ('curso',)
    list_filter = ('curso',)

class DisciplinaAdmin(admin.ModelAdmin):
    search_fields = ('disciplina', 'codigo',)
    list_display = ('disciplina', 'codigo',)
    list_filter = ('disciplina',)

class TurmaAdmin(admin.ModelAdmin):
    search_fields = ('turma', 'periodo','ano','curso',)
    list_display = ('turma', 'periodo','ano','curso',)
    list_filter = ('turma','ano','curso',)
    raw_id_fields = ('curso',)

class CampusAdmin(admin.ModelAdmin):
    search_fields = ('campus', )


class AlunoAdmin(admin.ModelAdmin):
    search_fields = ('nomecompleto', 'matricula',)
    raw_id_fields = ('usuario','turma',)
    fields = ( 'usuario', 'nomecompleto', 'matricula', 'turma','anoingresso', 'campus', 'disciplina', )
    filter_horizontal = ('disciplina',)
    list_filter = ('turma', 'campus',)
    list_display = ('nomecompleto', 'matricula',)


class ProfessorAdmin(admin.ModelAdmin):
    search_fields = ('nomecompleto', 'cracha',)
    raw_id_fields = ('usuario',)
    fields = ('usuario', 'nomecompleto', 'cracha', 'campus', 'disciplina', )
    filter_horizontal = ('disciplina',)
    list_filter = ('campus',)
    list_display = ('nomecompleto', 'cracha',)




admin.site.register(Curso, CursoAdmin)
admin.site.register(Disciplina, DisciplinaAdmin)
admin.site.register(Campus, CampusAdmin)
admin.site.register(Turma, TurmaAdmin)
admin.site.register(Aluno, AlunoAdmin)
admin.site.register(Professor, ProfessorAdmin)