from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def home(request):
    """首页视图函数"""
    return HttpResponse('Welcome to My Backup Project!')
