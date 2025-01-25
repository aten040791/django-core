from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from ..models import EventParticipant, Event, Participant
from modules.core.response.JsonResponseUtil import JsonResponseUtil
from django.core.cache import cache
from modules.core.redis.redis import redis
from ..decorators.authorization import have_permission
from ..forms.participant_form import ParticipantForm
from ..mappers.participant_mapper import ParticipantMapper
import json
from ..helpers.generate_qr_code import generate
from ..tasks.email.send_mail_event import task_send_mail
from datetime import datetime, timedelta

EVENT_QUEUE_KEY_TEMPLATE = "event_queue:{event_id}"

def all(request):
    participants = Participant.objects.all()
    if cache.has_key('participants', None): 
        participants = cache.get('participants', None)
    else:
        participants = ParticipantMapper.to_list_dto(participants)
        cache.set('participants', participants, 20, None)
    return JsonResponseUtil.Success({
        'participants': participants,
        'total': len(participants)
    })

@require_http_methods(["POST"])
@csrf_exempt
def store(request):
    body = json.loads(request.body)
    form = ParticipantForm(body)
    if form.is_valid():
        participant = form.save(commit=True)
        participant = ParticipantMapper.to_dto(participant)
        return JsonResponseUtil.Success({
            'participant': participant
        })
    
    return JsonResponseUtil.ValidationFailed(form.errors)

@require_http_methods(["DELETE"])
@csrf_exempt
def delete(request, participant_id):
    try:
        participant = Participant.objects.get(participant_id = participant_id)
        participant.delete()
        return JsonResponseUtil.Deleted()
    except Event.DoesNotExist:
        return JsonResponseUtil.NotFound()

@require_http_methods(["PUT"])
@csrf_exempt
def update(request, participant_id):
    try:
        participant_instance = Participant.objects.get(participant_id=participant_id)
        form = ParticipantForm(json.loads(request.body), instance=participant_instance)
        if form.is_valid():
            form.save()
            participant_dto = ParticipantMapper.to_dto(participant_instance)
            return JsonResponseUtil.Success({
                    'participant': participant_dto
                })
        return JsonResponseUtil.ValidationFailed(form.errors)
    except Event.DoesNotExist: 
        return JsonResponseUtil.NotFound()

def show(request, participant_id):
    try: 
        participant = Participant.objects.get(participant_id=participant_id)
        participant = ParticipantMapper.to_dto(participant)
        return JsonResponseUtil.Success({'participant': participant})
    except Participant.DoesNotExist:
        return JsonResponseUtil.NotFound()

@require_http_methods(["POST"])
@csrf_exempt
def register_event(request):
    body = json.loads(request.body)
    try:
        event_id = body.get('event_id')
        participant_id = body.get('participant_id')
        event = Event.objects.get(event_id=event_id)
        participant = Participant.objects.get(participant_id=participant_id)
        if EventParticipant.objects.filter(event=event, participant=participant).exists():
            return JsonResponseUtil.AlreadyExist()
        qr_name, qr_url = generate(request, {
            'event_name': event.event_name,
            'participant_name': participant.participant_id
        })
        EventParticipant.objects.create(
            event=event, 
            participant=participant,
            qr_code=qr_url
        )
        #send email confirm
        context_email_confirm = {
            'to_email': participant.email,
            'subject': "[Event Management] XÁC NHẬN ĐĂNG KÍ SỰ KIỆN",
            'attachments': {},
            'user_name': participant.full_name,
            'event_name': event.event_name,
            'event_start_date': event.start_date.strftime('%Y-%m-%d %H:%M:%S')
        }
        run_at = datetime.now() + timedelta(minutes=1)
        # send_email('confirm_event_subcribe.html', context_email_confirm)
        task_send_mail.apply_async(
            args=['confirm_event_subcribe.html', context_email_confirm],
            queue=EVENT_QUEUE_KEY_TEMPLATE.format(event_id=event.event_id),
            countdown=3
        )
        result = ParticipantMapper.to_dto(participant)
        return JsonResponseUtil.Success(result)
    except Exception as e: 
        return JsonResponseUtil.Error(message=e)
