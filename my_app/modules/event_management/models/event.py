from django.db import models
import os

# Create your models here.
class Event(models.Model):
    event_id = models.AutoField(primary_key=True)  # Primary Key
    event_name = models.CharField(max_length=100)  # Event name
    start_date = models.DateTimeField()  # Start date
    end_date = models.DateTimeField()  # End date
    cover_image = models.ImageField(upload_to='modules/event_management/storage/event_covers/', blank=True, null=True)  # Cover image (optional)
    cover_disk_storage=models.CharField(max_length=20, null=False, default="local")
    capacity = models.IntegerField(default=0)
    empty_slot = models.IntegerField(default=0)

    class Meta:
        db_table='events' 
    
    # Viết đè lên method .delete() mặc định của model, khi gọi .delete() trên model
    # sẽ trực tiếp gọi hàm này
    def delete(self, *args, **kwargs):
        # Delete file
        if self.cover_image and os.path.exists(self.cover_image.path):
            os.remove(self.cover_image.path)  # Remove file from file system
        return super().delete(args, kwargs)