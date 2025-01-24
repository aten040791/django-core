from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from ..models import EventParticipant, Event, Participant
from django.shortcuts import get_object_or_404
from modules.core.response.JsonResponseUtil import JsonResponseUtil
from django.core.cache import cache
from modules.core.redis.redis import redis

def all(request):
    participants = Participant.objects.all()
    if cache.has_key('participants', None): 
        participants = cache.get('participants', None)
    else:
        participants = list(participants.values())
        cache.set('participants', participants, 20, None)
    return JsonResponseUtil.Success({
        'participants': participants
    })

def create():
    print("")

def delete():
    print("")

def update():
    print("")

def show():
    print("")

@require_http_methods(["POST"])
@csrf_exempt
def register_event(request):
    body = request.POST
    try:
        event_id = body.get('event_id')
        participant_id = body.get('participant_id')
        event = get_object_or_404(Event, pk=event_id)
        participant = get_object_or_404(Participant, pk=participant_id)
        if EventParticipant.objects.filter(event=event, participant=participant).exists():
            return JsonResponseUtil.AlreadyExist()
        EventParticipant.objects.create(
            event, participant
        )

        return JsonResponseUtil.Success(body)
    except Exception as e: 
        return JsonResponseUtil.Error(e)
