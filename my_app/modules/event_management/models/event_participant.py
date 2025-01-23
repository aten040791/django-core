from django.db import models
from .event import Event
from .participant import Participant

class EventParticipant(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name='participants')  # Foreign Key to Event
    participant = models.ForeignKey(Participant, on_delete=models.CASCADE, related_name='events')  # Foreign Key to Participant
    qr_code = models.ImageField(upload_to='modules/event_management/storage/event_qr_codes/', blank=True, null=True)
    class Meta:
        db_table='event_participant'
        unique_together = ('event', 'participant')  # Ensure unique pairs of Event and Participant