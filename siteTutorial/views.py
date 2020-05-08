from django.shortcuts import render

# Create your views here.
def home(request):
    return render(request, 'siteTutorial/index.html')


def contato(request):
    return render(request, 'siteTutorial/contact.html')


def tutorial(request):
    return render(request, 'siteTutorial/tutorial.html')