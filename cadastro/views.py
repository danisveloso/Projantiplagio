from django.shortcuts import render
import random

from django.contrib.auth.decorators import login_required, permission_required
from django.core.exceptions import PermissionDenied
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404, render
from django.utils.decorators import method_decorator
from django.views.generic import DetailView, ListView, TemplateView, FormView
from django.http import HttpResponse
from django.views import View
from .models import Aluno, Turma, Curso, Professor, Campus, Disciplina
from itertools import chain

# Create your views here.


class AlunoListView(ListView):
    model = Aluno
    template_name = 'cadastro/aluno_list.html'

    @method_decorator(login_required)
    @method_decorator(permission_required('quiz.view_sittings'))
    def dispatch(self, request, *args, **kwargs):
        return super(AlunoListView, self)\
            .dispatch(request, *args, **kwargs)
    
    def get_context_data(self,**kwargs):
        context = super(AlunoListView, self).get_context_data(**kwargs)
        context['disciplinas'] = Disciplina.objects.all()
        return context

    def get_queryset(self):
        queryset = Aluno.objects.select_related('turma', 'turma__curso')
        
        turma_filter = self.request.GET.get('turma_filter')
        user_filter = self.request.GET.get('user_filter')
        curso_filter = self.request.GET.get('curso_filter')
        disciplina_filter = self.request.GET.get('disciplina_filter')

        if turma_filter:
            queryset = queryset.filter(turma__turma__icontains=turma_filter)
        if user_filter:
            queryset = queryset.filter(nomecompleto__icontains=user_filter)
        if curso_filter:
            queryset = queryset.filter(turma__curso__curso__icontains=curso_filter)
        if disciplina_filter:
            queryset = queryset.filter(disciplina=disciplina_filter)
        return queryset

class TurmaListView(ListView):
    model = Turma
    template_name = 'cadastro/turma_list.html'

    @method_decorator(login_required)
    @method_decorator(permission_required('quiz.view_sittings'))
    def dispatch(self, request, *args, **kwargs):
        return super(TurmaListView, self)\
            .dispatch(request, *args, **kwargs)

    def get_queryset(self):
        queryset = super(TurmaListView, self).get_queryset()
        turma_filter = self.request.GET.get('turma_filter')
        curso_filter = self.request.GET.get('curso_filter')
        campus_filter = self.request.GET.get('campus_filter')
        if turma_filter:
            queryset = queryset.filter(turma__icontains=turma_filter)
        if curso_filter:
            queryset = queryset.filter(curso__curso__icontains=curso_filter)
        if campus_filter:
            queryset = queryset.filter(campus__campus__icontains=campus_filter)


        return queryset
