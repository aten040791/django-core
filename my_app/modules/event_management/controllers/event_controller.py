from django.views.decorators.csrf import csrf_exempt
from django.forms.models import model_to_dict
import json
from ..forms.event_form import EventForm
from ..models import Event
from django.views.decorators.http import require_http_methods
from django.core.files.storage import FileSystemStorage
from ..decorators.authorization import have_permission
from modules.core.response.JsonResponseUtil import JsonResponseUtil
from django.core.cache import cache
from modules.core.redis.redis import redis

def all(request):
    events = Event.objects.all()
    if cache.has_key('events', None): 
        events = cache.get('events', None)
    else:
        events = list(events.values())
        # key, value, timeout, no version
        cache.set('events', events, 20, None)
    return JsonResponseUtil.Success({
        'events': events
    })
    
def show(request, event_id):
    try: 
        event = Event.objects.get(event_id=event_id)
        cover_image = event.cover_image.name
        # Chuyển sang dạng dict (key:value)
        event = model_to_dict(event, exclude=['cover_image'])
        event['cover_image'] = cover_image
        return JsonResponseUtil.Success({'event': event})
    except Event.DoesNotExist:
        return JsonResponseUtil.NotFound()
    
def show_querystring(request):
    # Get querystring key and default value
    event_id = request.GET.get('event_id', 'default_value')
    try: 
        event = Event.objects.get(event_id=event_id)
        # Chuyển sang dạng dict (key:value)
        event_dict = model_to_dict(event, exclude=['cover_image'])
        event_dict['cover_image'] = event.cover_image.url
        event_dict['start_date'] = event.start_date.isoformat()
        event_dict['end_date'] = event.end_date.isoformat()
        # Store using native redis, json.dumps == JSON.stringify(obj)
        redis.set('event:'+ str(event_id), json.dumps(event_dict))
        # Demo printing with using decode to decode byte to string and convert to dict using json.loads
        # event_after_decode = redis.get('event:'+str(event_id)).decode()
        # print(json.loads(event_after_decode)['event_id'])
        return JsonResponseUtil.Success({'event': event_dict})
    except Event.DoesNotExist:
        return JsonResponseUtil.NotFound()
    
def show_with_relationship(request, event_id):
    try:
        event = Event.objects.get(event_id=event_id)
        cover_image = event.cover_image.name
        event_data = model_to_dict(event, exclude=[''])
        event_data['cover_image'] = cover_image
        event_data['participants'] = list(event.participants.all().values())
        return JsonResponseUtil.Success(event_data)
    except Event.DoesNotExist:
        return JsonResponseUtil.NotFound()

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
    return JsonResponseUtil.Success({'event': event_dict})

@require_http_methods("POST")
@csrf_exempt
# Using decorator
@have_permission()
def store_fillable(request):
    # Receive form request
    form = EventForm(request.POST, files=request.FILES)
    if form.is_valid():
        event = form.save(commit=True)
        event_dict = model_to_dict(event, exclude=['cover_image'])
        event_dict['cover_image'] = event.cover_image.url
        return JsonResponseUtil.Success({'event': event_dict})
    # Get form error
    return JsonResponseUtil.ValidationFailed(form.errors)

@require_http_methods(["PUT"])
@csrf_exempt
def update(request, event_id):
    try:
        event_instance = Event.objects.get(event_id = event_id)
        event = model_to_dict(event_instance)
        event['cover_image'] = event_instance.cover_image.url
        # Must have instance = ... when updating
        form = EventForm(json.loads(request.body), instance=event_instance)
        if form.is_valid():
            form.save()
            return JsonResponseUtil.Success({
                    'event': event
                })
        return JsonResponseUtil.ValidationFailed(form.errors)
    except Event.DoesNotExist: 
        return JsonResponseUtil.NotFound()

@require_http_methods(["DELETE"])
@csrf_exempt
def delete(request, event_id):
    try:
        event = Event.objects.get(event_id = event_id)
        # Calling delete to delete model
        event.delete()
        return JsonResponseUtil.Deleted()
    except Event.DoesNotExist:
        return JsonResponseUtil.NotFound()