from django.db import models

# Create your models here.
class Event(models.Model):
    event_id = models.AutoField(primary_key=True)  # Primary Key
    event_name = models.CharField(max_length=100)  # Event name
    start_date = models.DateTimeField()  # Start date
    end_date = models.DateTimeField()  # End date
    cover_image = models.ImageField(upload_to='event_covers/', blank=True, null=True)  # Cover image (optional)
    class Meta:
        db_table='events' 

class Participant(models.Model):
    participant_id = models.AutoField(primary_key=True)  # Primary Key
    full_name = models.CharField(max_length=255)  # Participant's full name
    email = models.EmailField(unique=True)  # Email (unique constraint)
    phone_number = models.CharField(max_length=15, blank=True, null=True)  # Phone number (optional)
    class Meta:
        db_table='participants' 

class EventParticipant(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name='participants')  # Foreign Key to Event
    participant = models.ForeignKey(Participant, on_delete=models.CASCADE, related_name='events')  # Foreign Key to Participant

    class Meta:
        db_table='event_participant'
        unique_together = ('event', 'participant')  # Ensure unique pairs of Event and Participant

