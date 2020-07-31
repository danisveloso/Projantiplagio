try:
    from django.conf.urls import url, include
except ImportError:
    from django.urls import re_path as url

from django.urls import path

from .views import home, contato, topicos, topico1, topico2, topico3, topico4, citacao, referencia, resumo, topico5

urlpatterns = [
    url(r'^$', home, name='siteTutorial_home'),
    path('contato', contato, name='siteTutorial_contato'),
    path('topicos', topicos, name='siteTutorial_topicos'),
    path('topico1', topico1, name='siteTutorial_topico1'),
    path('topico2', topico2, name='siteTutorial_topico2'),
    path('topico3', topico3, name='siteTutorial_topico3'),
    path('topico4', topico4, name='siteTutorial_topico4'),
    path('citacao', citacao, name='siteTutorial_citacao'),
    path('referencia', referencia, name='siteTutorial_referencia'),
    path('resumo', resumo, name='siteTutorial_resumo'),
    path('topico5', topico5, name='siteTutorial_topico5'),
]
