from django import forms
from ..models import AuthUserApi
import hashlib

class AuthLoginForm(forms.ModelForm):
    class Meta:
        model = AuthUserApi
        # fillable
        fields = ['email', 'password']
    
    def save(self, commit=True):
        instance = super().save(commit=False)
        if commit == False:
            raw_password = self.cleaned_data.get('password')
            instance.password = hashlib.md5(raw_password.encode('utf-8')).hexdigest()
        
        if commit == True:
            instance.save()
        return instance
        
        