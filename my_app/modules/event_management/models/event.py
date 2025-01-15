from django.db import models

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