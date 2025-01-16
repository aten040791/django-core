from django.db import models

class Permission(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    route = models.CharField(max_length=100, default='', null=False)
    method = models.CharField(max_length=6, default='GET', null=False)
    friendly_name = models.CharField(max_length=100, blank=True, null=False)

    class Meta:
        db_table = 'auth_permission'