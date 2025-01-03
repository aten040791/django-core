# Generated by Django 5.1.4 on 2025-01-01 06:32

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('event_id', models.AutoField(primary_key=True, serialize=False)),
                ('event_name', models.CharField(max_length=255)),
                ('start_date', models.DateTimeField()),
                ('end_date', models.DateTimeField()),
                ('cover_image', models.ImageField(blank=True, null=True, upload_to='event_covers/')),
            ],
        ),
        migrations.CreateModel(
            name='Participant',
            fields=[
                ('participant_id', models.AutoField(primary_key=True, serialize=False)),
                ('full_name', models.CharField(max_length=255)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('phone_number', models.CharField(blank=True, max_length=15, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='EventParticipant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('event_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='participants', to='event_management.event')),
                ('participant_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='events', to='event_management.participant')),
            ],
            options={
                'unique_together': {('event_id', 'participant_id')},
            },
        ),
    ]
