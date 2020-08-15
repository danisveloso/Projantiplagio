from django.shortcuts import render
import random

from django.contrib.auth.decorators import login_required, permission_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, render
from django.utils.decorators import method_decorator
from django.views.generic import DetailView, ListView, TemplateView, FormView
from django.http import HttpResponse
from django.views import View
from .models import Aluno, Turma, Curso, Professor, Campus, Disciplina

# Create your views here.


class AlunoListView(ListView):
    model = Aluno

    def get_queryset(self):
        queryset = super(AlunoListView, self).get_queryset()
        turma_filter = self.request.GET.get('turma_filter')
        user_filter = self.request.GET.get('user_filter')
        if turma_filter:
            queryset = queryset.filter(turma__turma__icontains=turma_filter) 

        if user_filter:
            queryset = queryset.filter(usuario__username__icontains=user_filter)

        return queryset

class TurmaListView(ListView):
    model = Turma

    def get_queryset(self):
        queryset = super(TurmaListView, self).get_queryset()
        curso_filter = self.request.GET.get('curso_filter')

