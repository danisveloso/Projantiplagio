from django.contrib import admin
from django.contrib.auth.models import User
from .models import Curso, Disciplina, Campus, Professor, Aluno
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

class CampusAdmin(admin.ModelAdmin):
    search_fields = ('campus', )


class AlunoAdmin(admin.ModelAdmin):
    search_fields = ('usuario', 'matricula',)
    fields = ( 'usuario','matricula','curso', 'anoingresso', 'campus', 'disciplina', )
    filter_horizontal = ('disciplina',)
    list_filter = ('curso', 'campus',)
    list_display = ('usuario', 'matricula',)


class ProfessorAdmin(admin.ModelAdmin):
    search_fields = ('usuario', 'cracha',)
    fields = ('usuario', 'cracha', 'campus', 'disciplina', )
    filter_horizontal = ('disciplina',)
    list_filter = ('campus',)
    list_display = ('usuario', 'cracha',)




admin.site.register(Curso, CursoAdmin)
admin.site.register(Disciplina, DisciplinaAdmin)
admin.site.register(Campus, CampusAdmin)
admin.site.register(Aluno, AlunoAdmin)
admin.site.register(Professor, ProfessorAdmin)