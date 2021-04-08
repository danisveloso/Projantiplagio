from django.contrib.auth.decorators import login_required, permission_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import get_object_or_404, render
from django.views import View
from django.utils.decorators import method_decorator
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from .models import Contato

# Create your views here.
def home(request):
    return render(request, 'siteTutorial/index.html')


def contato(request):
    mensagem = ''
    if request.method == 'POST':
        try:
            contato = {}
            contato['nome'] = request.POST.get('nome')
            contato['email'] = request.POST.get('email')
            contato['mensagem'] = request.POST.get('mensagem')
            Contato.objects.create(**contato)
        except Exception as e:
            mensagem = str(e)
        else:
            mensagem = 'Contato realizado com sucesso'

    return render(request, 'siteTutorial/contact.html', {'mensagem': mensagem})


def topicos(request):
    return render(request, 'siteTutorial/tutorial.html')


@login_required
def topico1(request):
    return render(request, 'siteTutorial/topico1.html')

@login_required
def topico2(request):
    return render(request, 'siteTutorial/topico2.html')

@login_required
def topico3(request):
    return render(request, 'siteTutorial/topico3.html')


@login_required
def topico4(request):
    return render(request, 'siteTutorial/topico4.html')


@login_required
def citacao(request):
    return render(request, 'siteTutorial/citacao.html')


@login_required
def referencia(request):
    return render(request, 'siteTutorial/referencia.html')


@login_required
def resumo(request):
    return render(request, 'siteTutorial/resumo.html')
