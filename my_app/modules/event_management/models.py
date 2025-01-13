from django.db import models
from django.contrib.auth.hashers import check_password, make_password

# Create your models here.
class Event(models.Model):
    event_id = models.AutoField(primary_key=True)  # Primary Key
    event_name = models.CharField(max_length=100)  # Event name
    start_date = models.DateTimeField()  # Start date
    end_date = models.DateTimeField()  # End date
    cover_image = models.ImageField(upload_to='modules/event_management/storage/event_covers/', blank=True, null=True)  # Cover image (optional)
    cover_disk_storage=models.CharField(max_length=20, null=False, default="local")
        
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


class AuthUserApiManager(models.Manager):
    def authenticate(self, email, password):
        try:
            user = self.get(email=email)  # Get the user by email
            if check_password(password, user.password):  # Compare raw password with hashed
                return user  # Return the user if the password matches
            else:
                return None  # Invalid password
        except self.model.DoesNotExist:
            return None  # User not found

class AuthUserApi(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=150, null=False, unique=True)
    password = models.CharField(max_length=100, null=False)
    objects = AuthUserApiManager()
    
    class Meta:
        db_table = 'api_users'
        
    # Calling save() directly on model to hash password
    def save(self, *args, **kwargs):
        if self.password:
            self.password = make_password(password=self.password)
        super().save(args, kwargs)
        
    
