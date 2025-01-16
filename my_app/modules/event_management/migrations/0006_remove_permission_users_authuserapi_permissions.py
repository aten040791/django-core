# Generated by Django 5.1.4 on 2025-01-15 10:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event_management', '0005_permission_method_permission_route'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='permission',
            name='users',
        ),
        migrations.AddField(
            model_name='authuserapi',
            name='permissions',
            field=models.ManyToManyField(db_table='auth_user_permission', related_name='permissions', to='event_management.permission'),
        ),
    ]
