from django.shortcuts import render

# Create your views here.
def home(request):
    return render(request, 'my_app/home.html', {
        'title': '我的项目备份首页',
        'message': '欢迎访问我的项目备份系统'
    })
