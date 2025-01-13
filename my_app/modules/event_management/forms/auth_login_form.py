from django import forms
from ..models import AuthUserApi
import hashlib

class AuthLoginForm(forms.ModelForm):
    class Meta:
        model = AuthUserApi
        # fillable
        fields = ['email', 'password']        
        