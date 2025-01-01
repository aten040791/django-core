from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"), # index là tên hàm trong file views.py
]