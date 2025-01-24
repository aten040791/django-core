from django import forms
from ..models import Participant
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
import re

class ParticipantForm(forms.ModelForm):
    class Meta:
        model = Participant
        # fiilable
        fields = ['email', 'full_name', 'phone_number']

    def clean_email(self):
        email = self.cleaned_data.get('email')
        try:
            validate_email(email)
        except ValidationError as e:
            raise forms.ValidationError(e)   
        return email
    
    def clean_phone_number(self):
        phone_number = self.cleaned_data.get('phone_number'),
        is_valid = re.match(r'/(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/', phone_number)
        if not is_valid:
            raise forms.ValidationError('message.custom') 
        return phone_number
    
    def clean_full_name(self):
        full_name = self.cleaned_data.get('full_name'),
        if len(full_name) < 5 or len(full_name) > 50:
            raise forms.ValidationError('message.custom')
        pattern = r'^[A-ZÀ-Ỵ][a-zà-ỹ]{1,49}(?:[-\' ][A-ZÀ-Ỵ][a-zà-ỹ]{1,49})*$'
        is_valid = re.match(pattern, full_name)
        if not is_valid:
            raise forms.ValidationError('message.custom')
        return full_name
        
        
        
