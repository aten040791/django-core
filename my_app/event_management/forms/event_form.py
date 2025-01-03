from django import forms
from ..models import Event
from django.core.exceptions import ValidationError

class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        # fiilable
        fields = ['event_name', 'start_date', 'end_date', 'cover_image']
    
    # available rule:
    # event_name = forms.URLField()
    # custom rule:
    def clean_event_name(self):
        event_name = self.cleaned_data.get('event_name')
        if len(event_name) < 3:
            raise ValidationError('message.minlength:3')
        return event_name
    
    def clean_end_date(self):
        end_date = self.cleaned_data.get('end_date')
        start_date = self.cleaned_data.get('start_date')
        if end_date < start_date:
            raise ValidationError('end_date must greater than start_date')
        return end_date