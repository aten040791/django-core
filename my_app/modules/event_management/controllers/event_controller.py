from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.forms.models import model_to_dict
import json
from ..forms.event_form import EventForm
from ..models import Event
from django.views.decorators.http import require_http_methods
from django.shortcuts import get_object_or_404
from django.core.files.storage import FileSystemStorage

def all():
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
    
def show_with_relationship(request, event_id):
    try:
        event = Event.objects.get(event_id=event_id)
        cover_image = event.cover_image.name
        event_data = model_to_dict(event, exclude=[''])
        event_data['cover_image'] = cover_image
        event_data['participants'] = list(event.participants.all().values())
        return JsonResponse({
            'success': True,
            'data': event_data,
            'message': 'ok'
        })
    except Event.DoesNotExist:
        return JsonResponse({'success': False, 'message': 'Event not found'}, status=404)

@require_http_methods(["POST"])
@csrf_exempt
def store(request):
    # request.POST form data
    body = request.POST
    # Upload file
    cover_image = request.FILES['cover_image']
    # Upload file - Specify path
    file_storage = FileSystemStorage(location='event_management/storage/event_covers', base_url='event_management/event_covers')
    file_storage.save(cover_image.name, cover_image) # cover_image.name can change to any string file name (e.g. haha.jpg)
    # json.loads(request.body) for JSON data
    event = Event.objects.create(
        event_name= body.get('event_name'), 
        start_date=body.get('start_date'), 
        end_date=body.get('end_date'), 
        cover_image= cover_image.name
    )
    event_dict = model_to_dict(event, exclude=['cover_image'])
    # Get storage url
    event_dict['cover_image'] = file_storage.url(cover_image) 
    return JsonResponse({
        'success': True,
        'data': {
            'event': event_dict
        },
        'message': 'ok'
    })

@require_http_methods("POST")
@csrf_exempt
def store_fillable(request):
    # Receive form request
    form = EventForm(request.POST, files=request.FILES)
    if form.is_valid():
        event = form.save(commit=True)
        event_dict = model_to_dict(event, exclude=['cover_image'])
        event_dict['cover_image'] = event.cover_image.url
        return JsonResponse({
            'success': True,
            'data': {
                'event': event_dict
            },
            'message': 'ok',
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
    }, status=522)

@require_http_methods(["DELETE"])
@csrf_exempt
def delete(request, event_id):
    try:
        event = get_object_or_404(Event, event_id = event_id)
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
    
