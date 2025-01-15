from django.db import models

class Participant(models.Model):
    participant_id = models.AutoField(primary_key=True)  # Primary Key
    full_name = models.CharField(max_length=255)  # Participant's full name
    email = models.EmailField(unique=True)  # Email (unique constraint)
    phone_number = models.CharField(max_length=15, blank=True, null=True)  # Phone number (optional)
    class Meta:
        db_table='participants' 