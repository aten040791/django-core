# Generated by Django 5.1.4 on 2025-01-01 07:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('event_management', '0002_alter_event_table_alter_eventparticipant_table_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='eventparticipant',
            old_name='event_id',
            new_name='event',
        ),
        migrations.RenameField(
            model_name='eventparticipant',
            old_name='participant_id',
            new_name='participant',
        ),
    ]
