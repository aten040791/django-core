# Generated by Django 5.1.4 on 2025-01-15 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event_management', '0006_remove_permission_users_authuserapi_permissions'),
    ]

    operations = [
        migrations.AddField(
            model_name='permission',
            name='friendly_name',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]