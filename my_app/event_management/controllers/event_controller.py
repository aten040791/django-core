from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.forms.models import model_to_dict
import json
from ..forms.event_form import EventForm
from ..models import Event
from django.views.decorators.http import require_POST, require_http_methods


def all(request):
    events = Event.objects.all()
    return JsonResponse({
        'success': True,
        'data':{
            'events': list(events.values())
        },
        'message': 'ok'
    })
    
def show(request, event_id):
    event = Event.objects.get(event_id=event_id)
    cover_image = event.cover_image.name
    # Chuyển sang dạng dict (key:value)
    event = model_to_dict(event, exclude=['cover_image'])
    event['cover_image'] = cover_image
    return JsonResponse({
        'success': True,
        'data': {
            'event': event,
        },
        'message': 'ok'
    }, safe=False)
    
def show_querystring(request):
    # Get querystring key and default value
    event_id = request.GET.get('event_id', 'default_value')
    event = Event.objects.get(event_id=event_id)
    cover_image = event.cover_image.name
    # Chuyển sang dạng dict (key:value)
    event = model_to_dict(event, exclude=['cover_image'])
    event['cover_image'] = cover_image
    return JsonResponse({
        'success': True,
        'data': {
            'event': event,
        },
        'message': 'ok'
    }, safe=False)

@require_POST
@csrf_exempt
def store(request):
    # request.POST form data
    body = request.POST
    # json.loads(request.body) for JSON data
    Event.objects.create(
        event_name=body.get('event_name'), 
        start_date=body.get('start_date'), 
        end_date=body.get('end_date'), 
        cover_image = body.get('cover_image')
    )
    return JsonResponse({
        'success': True,
        'message': 'ok'
    })

@require_POST
@csrf_exempt
def store_fillable(request):
    # Receive form request
    form = EventForm(json.loads(request.body))
    if form.is_valid():
        event = form.save()
        return JsonResponse({
            'success': True,
            'message': 'ok',
            'data': {
                'event': model_to_dict(event, exclude=['cover_image'])
            }
        })
    # Get form error
    return JsonResponse({
        'success': False,
        'data': {
            'errors': form.errors
        },
        'message': 'validation failed'
    })

@require_http_methods(["PUT"])
@csrf_exempt
def update(request, event_id):
    try:
        event = Event.objects.get(event_id = event_id)
    except Event.DoesNotExist: 
        return JsonResponse({
            'message': 'Model not found',
            'success': False
        }, status=404)
        
    form = EventForm(json.loads(request.body))
    if form.is_valid():
        event = form.save()
        return JsonResponse({
            'success': True,
            'message': 'ok',
            'data': {
                'event': model_to_dict(event, exclude=['cover_image'])
            }
        })
    return JsonResponse({
        'success': False,
        'data': {
            'errors': form.errors
        },
        'message': 'Cannot save model'
    })

@require_http_methods(["DELETE"])
@csrf_exempt
def delete(request, event_id):
    try:
        event = Event.objects.get(event_id = event_id)
        event.delete()
        return JsonResponse({
            'success': True,
            'message': 'ok'
        })
    except Event.DoesNotExist:
        return JsonResponse({
            'message': 'Model not found',
            'success': False
        }, status=404)
    