from __future__ import unicode_literals
from six import python_2_unicode_compatible
from django.utils.translation import ugettext_lazy as _
from django.db import models
from quiz.models import Question

import re
import math
import pandas as pd
import numpy as np
import nltk
import os
import nltk.corpus
import string
from nltk.tokenize import word_tokenize
from collections import Counter
from nltk import word_tokenize
from nltk.probability import FreqDist
from nltk.corpus import stopwords
from nltk.corpus import floresta
from nltk import ne_chunk
from nltk.util import ngrams
from heapq import nlargest


OPTIONS_CITATION = (
    ('direta', _('Citação direta')),
    ('indireta', _('Citação indireta')),
    ('resumo', _('Resumo'))
)

class ReferenciaManager(models.Manager):

    def new_referencia(self, referencia):
        new_referencia = self.create(referencia=re.sub('\s+', '-', referencia)
                                     .lower())

        new_referencia.save()
        return new_referencia

@python_2_unicode_compatible
class Referencia(models.Model):
    referencia = models.TextField(max_length=1000,
                               blank=False,
                               help_text=_("Digite a referência correta para o texto"),
                               verbose_name=_("Referência"))
    
    objects = ReferenciaManager()

    def __str__(self):
        return self.referencia



@python_2_unicode_compatible
class Essay_Question(Question):
    tipo_citacao = models.CharField(
        max_length=30, blank=False, null=True,
        choices=OPTIONS_CITATION,
        help_text=_("Escolha qual tipo de citação o aluno terá que fazer nesta questão"),
        verbose_name=_("tipo de citação"))
    original_text = models.CharField(
        max_length=1000, blank=False,
	verbose_name=_("Texto original"),
        help_text=_("Tamanho máximo do texto 1000 caracteres"))
    referencia = models.ForeignKey(
        Referencia, blank=False, 
        verbose_name=_("Referência"), on_delete=models.PROTECT)
    
    citacao1 = models.CharField(max_length=1000, 
                               blank=False, null=True,
                               help_text=_("Digite como é a citação correta para a pergunta. Exemplo: Autor (ano)"),
                               verbose_name=_("Citação"))
    citacao2 = models.CharField(max_length=1000, 
                               blank=False, null=True,
                               help_text=_("Digite como é a citação correta para a pergunta. Exemplo: (AUTOR, ANO)"),
                               verbose_name=_("Citação"))

    

    def check_if_correct(self, guess):
        parafrase = guess
        text = str(self.original_text)  

        sent_text_original = tratamento_texto(text)
        sent_text_parafrase = tratamento_texto(parafrase)      

        if self.tipo_citacao == 'direta':

            check_citacao_direta =  verificar_citacao(parafrase, self.citacao1, self.citacao2)         
            final_list = compare_list(sent_text_original,sent_text_parafrase)
            if not final_list or check_citacao_direta == False:
                return False
            else:
                return True
        
        if self.tipo_citacao == 'indireta':

            filtered_stopwords_original = get_stopwords(text)
            filtered_stopwords_parafrase = get_stopwords(parafrase)

            ngram_original = get_ngrams(filtered_stopwords_original)
            ngram_parafrase = get_ngrams(filtered_stopwords_parafrase)

           
            common = compare_ngram(ngram_original,ngram_parafrase)
            # talvez ajustar para usar contagem caracteres para ajustar o algoritmo de similaridade 
            similaridade = cosine_similarity_ngrams(ngram_original, ngram_parafrase)


            check_citacao_indireta =  verificar_citacao(parafrase, self.citacao1, self.citacao2)


            #verificar a frequencia de palavras nos dois textos, se não houver nenhum tipo de similaridade é possivel que o aluno está enganando a ferramenta
            freq_original = FreqDist(filtered_stopwords_original)
            freq_parafrase = FreqDist(filtered_stopwords_parafrase)
            common_freq = compare_list(freq_original,freq_parafrase)
           

            important_words = palavras_importantes(freq_original) 


            #teste = get_chunk(common)

            if common or not common_freq or check_citacao_indireta == False:
                return False
            else:
                return True

        if self.tipo_citacao == 'resumo':
            return False
        
    def check_similaridade(self, guess):
        parafrase = guess
        text = str(self.original_text)  

        sent_text_original = tratamento_texto(text)
        sent_text_parafrase = tratamento_texto(parafrase)      

        if self.tipo_citacao == 'direta':

            check_citacao_direta =  verificar_citacao(parafrase, self.citacao1, self.citacao2)         
            final_list = compare_list(sent_text_original,sent_text_parafrase)
            if not final_list or check_citacao_direta == False:
                return "Você não fez a citação direta corretamente"
            else:
                return "Texto:" + final_list 
        
        if self.tipo_citacao == 'indireta':

            filtered_stopwords_original = get_stopwords(text)
            filtered_stopwords_parafrase = get_stopwords(parafrase)

            ngram_original = get_ngrams(filtered_stopwords_original)
            ngram_parafrase = get_ngrams(filtered_stopwords_parafrase)

           
            common = compare_ngram(ngram_original,ngram_parafrase)
            # talvez ajustar para usar contagem caracteres para ajustar o algoritmo de similaridade 
            similaridade = cosine_similarity_ngrams(ngram_original, ngram_parafrase)

            similaridade = round(similaridade,2)*100

            check_citacao_indireta =  verificar_citacao(parafrase, self.citacao1, self.citacao2)


            #verificar a frequencia de palavras nos dois textos, se não houver nenhum tipo de similaridade é possivel que o aluno está enganando a ferramenta
            freq_original = FreqDist(filtered_stopwords_original)
            freq_parafrase = FreqDist(filtered_stopwords_parafrase)
            common_freq = compare_list(freq_original,freq_parafrase)
           

            important_words = palavras_importantes(freq_original) 


            if common:
                return "Similaridade:" + str(similaridade) + "%. Seu texto contém trechos idênticos ao texto original."
            else: 
                if not common_freq:
                    return "Seu texto não tem nenhum tipo de similaridade com original, podendo indicar que você está tentando enganar a ferramenta."
            return "Não foi encontrado trechos semelhantes com o texto original."
            

        if self.tipo_citacao == 'resumo':
            return False
       
    def get_citacao(self, guess):
        parafrase = guess
        check_citacao_direta =  verificar_citacao(parafrase, self.citacao1, self.citacao2)         
        if check_citacao_direta == False:
            return "Você não fez a citação corretamente. Existem duas maneiras de citar corretamente o texto: " + self.citacao1 + " ou " + self.citacao2 +"."
        else:
            return  "Citação feita corretamente." 
        

                
    def get_answers(self,guess):
        
        return guess

    def get_answers_list(self):
        return False

    def get_original_text(self):
        return self.original_text

    def answer_choice_to_string(self, guess):
        return str(guess)

    def __str__(self):
        return self.content

    class Meta:
        verbose_name = _("Questão dissertativa")
        verbose_name_plural = _("Questões dissertativas")

#https://medium.com/@viniljf/utilizando-processamento-de-linguagem-natural-para-criar-um-sumariza%C3%A7%C3%A3o-autom%C3%A1tica-de-textos-775cb428c84e
def dist_frequencia(text):
    filtered_stopwords = get_stopwords(text)
    frequencia = FreqDist(filtered_stopwords)
    return frequencia



def palavras_importantes(frequencia):
    top_palavras = nlargest(8, frequencia, frequencia.get)
    return top_palavras



def verificar_citacao(parafrase, citacao1, citacao2):
    if citacao1 in parafrase or citacao2 in parafrase:
        return True
    return False

def get_chunk(texto):
    token = word_tokenize(texto)
    tags = nltk.pos_tag(token)
    chunk = ne_chunk(tags)
    return chunk
   
def get_stopwords(texto):
    #Remove stopwords e pontuações
    stop_words = set(stopwords.words('portuguese'))
    word_tokens = word_tokenize(texto.lower())
    # antes de retirar stopwords preciso colocar o texto em letras minúsculas
    filtered_sentence = [w for w in word_tokens if w not in stop_words and w not in string.punctuation]
    filtered_sentence = []
    for w in word_tokens: 
        if w not in stop_words and w not in string.punctuation: 
            filtered_sentence.append(w)
    return filtered_sentence
    
def get_ngrams(texto):
    n = 4
    fgrams=[]
    ngram = ngrams(texto,n)
    for grams in ngram:
        fgrams.append(grams)
    return fgrams

def append_elements(n_gram):
    for element in range(len(n_gram)):
        phrase = ''
        for sub_element in n_gram[element]:
            phrase += sub_element+' '
            n_gram[element] = phrase.strip().lower()
    return n_gram



def compare_ngram(n_gram1, n_gram2):
    n_gram1 = append_elements(n_gram1)
    n_gram2 = append_elements(n_gram2)
    common = []
    for phrase in n_gram1:
        if phrase in n_gram2:
            common.append(phrase)
       
    return common

def tratamento_texto(texto):
    # Convert list to string
    str1= ''.join(texto)
       
    #split the string
    sent_text=str1.split('.')
    return sent_text

def compare_list(sent_text1,sent_text2):
    #create a for loop that compares two lists
    final_list=[]
    for z in sent_text1:
        for y in sent_text2:
            if z == y:
                final_list.append(z)
    return final_list    
        


def cosine_similarity_ngrams(a, b):
    vec1 = Counter(a)
    vec2 = Counter(b)
      
    intersection = set(vec1.keys()) & set(vec2.keys())
    numerator = sum([vec1[x] * vec2[x] for x in intersection])
    sum1 = sum([vec1[x]**2 for x in vec1.keys()])
    sum2 = sum([vec2[x]**2 for x in vec2.keys()])
    denominator = math.sqrt(sum1) * math.sqrt(sum2)
    if not denominator:
        return 0.0
    return float(numerator) / denominator



