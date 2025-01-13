from django import forms
from ..models import AuthUserApi

class AuthLoginForm(forms.Form):
    email = forms.EmailField(min_length=7)
    password = forms.CharField(min_length=5)
    class Meta:
        # fillable
        fields = ['email', 'password']

# This validation goes directly to model    
class AuthRegisterForm(forms.ModelForm):
    class Meta:
        model = AuthUserApi
        # fillable
        fields = ['email', 'password']
        