# Generated by Django 5.1.4 on 2025-01-03 10:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event_management', '0005_alter_eventparticipant_unique_together'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='event_name',
            field=models.CharField(max_length=100),
        ),
    ]
