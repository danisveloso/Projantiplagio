try:
    from django.conf.urls import url, include
except ImportError:
    from django.urls import re_path as url

from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import AlunoListView
 

urlpatterns = [
    path('aluno/', AlunoListView.as_view()),
]
