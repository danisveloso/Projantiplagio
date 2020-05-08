from django.contrib import admin
from django.urls import path, include, re_path as url
from .views import home, contato, tutorial

urlpatterns = [
    url(r'^$', home, name='siteTutorial_home'),
    url(r'^contato$', contato, name='siteTutorial_contato'),
    path('tutorial', tutorial, name='siteTutorial_tutorial'),
]
