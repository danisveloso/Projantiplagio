try:
    from django.conf.urls import url, include
except ImportError:
    from django.urls import re_path as url

from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import QuizListView, CategoriesListView, \
    ViewQuizListByCategory, QuizUserProgressView, QuizMarkingList, \
    QuizMarkingDetail, QuizDetailView, QuizTake, SystemFeedbackView, \
    QuizUserDetail, QuizProfProgressView, QuizTurmaProgressView

urlpatterns = [

    url(r'^$',
        view=QuizListView.as_view(),
        name='quiz_index'),

    url(r'^category/$',
        view=CategoriesListView.as_view(),
        name='quiz_category_list_all'),

    url(r'^category/(?P<category_name>[\w|\W-]+)/$',
        view=ViewQuizListByCategory.as_view(),
        name='quiz_category_list_matching'),

    path('progress/',
        view=QuizUserProgressView.as_view(),
        name='progress'),

    url(r'^marking/$',
        view=QuizMarkingList.as_view(),
        name='quiz_marking'),

    url(r'^marking/(?P<pk>[\d.]+)/$',
        view=QuizMarkingDetail.as_view(),
        name='quiz_marking_detail'),

    url(r'^userdetail/(?P<pk>[\d.]+)/(?P<pk2>[\d.]+)/$',
        view=QuizMarkingDetail.as_view(),
        name='usuario_detail'),

    url(r'^userquiz/(?P<pk>[\d.]+)/$',
        view=QuizUserDetail.as_view(),
        name='quiz_user_detail'),

    url(r'^progressdetail/(?P<pk>[\d.]+)/$',
        view=QuizProfProgressView.as_view(),
        name='progress_detail'),

    url(r'^progressturma/(?P<pk>[\d.]+)/$',
        view=QuizTurmaProgressView.as_view(),
        name='progress_turma'),
    


    #  passes variable 'quiz_name' to quiz_take view
    url(r'^(?P<slug>[\w-]+)/$',
        view=QuizDetailView.as_view(),
        name='quiz_start_page'),

    
    url(r'^(?P<quiz_name>[\w-]+)/take/$',
        view=QuizTake.as_view(),
        name='quiz_question'),

    url(r'^feedback/(?P<pk>[\d.]+)/$',
        view=SystemFeedbackView.as_view(),
        name='feedback'),
    
   

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL,
    document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)