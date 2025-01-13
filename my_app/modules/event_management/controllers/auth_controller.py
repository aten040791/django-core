from django.http import JsonResponse
import jwt, json
from ..forms.auth_login_form import AuthLoginForm
from my_app import settings
import datetime
import hashlib
from ..models import AuthUserApi

def login(request):
    form = AuthLoginForm(json.loads(request.body))  
    if form.is_valid():
        current_time = datetime.datetime.now(datetime.timezone.utc)
        # Get data after validation
        email = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password')
        try:
            # Check against db
            user = AuthUserApi.objects.authenticate(email, password)
            jwt_access_token = jwt.encode(
                payload={
                    'data': {
                        'id': user.id,
                        'email': user.email
                    },
                    'iat': current_time,
                    'exp': current_time + datetime.timedelta(minutes=5), # 5 minute
                }, key=settings.JWT_SECRET, algorithm="HS256")
                
            jwt_refresh_token = jwt.encode(
            payload={
                'data': {
                    'id': user.id,
                    'email': user.email
                },
                'iat': current_time,
                'exp': current_time + datetime.timedelta(days=7), # 5 minute
            }, key=settings.JWT_SECRET, algorithm="HS256")
            
            return JsonResponse({
                'status': 200,
                'data': {
                    'access_token': jwt_access_token,
                    'refresh_token': jwt_refresh_token,
                },
                'message': 'ok',
                'success': True
            }, status=200)
            
        except AuthUserApi.DoesNotExist:
            return JsonResponse({
                'success': False
            }, status = 401)
    
        

def register(request):
    form = AuthLoginForm(json.loads(request.body))
    if form.is_valid():
        api_user = form.save(commit=True)   # Save to database directly
        current_time = datetime.datetime.now(datetime.timezone.utc)
        jwt_access_token = jwt.encode(
            payload={
                'data': {
                    'id': api_user.id,
                    'email': api_user.email
                },
                'iat': current_time,
                'exp': current_time + datetime.timedelta(minutes=5), # 5 minutes
        }, key=settings.JWT_SECRET, algorithm="HS256")
        
        jwt_refresh_token = jwt.encode(
            payload={
                'data': {
                    'id': api_user.id,
                    'email': api_user.email
                },
                'iat': current_time,
                'exp': current_time + datetime.timedelta(days=7), # 7 days
            
        }, key=settings.JWT_SECRET, algorithm="HS256")
        return JsonResponse({
            'status': 200,
            'data': {
                'access_token': jwt_access_token,
                'refresh_token': jwt_refresh_token,
            },
            'message': 'ok',
            'success': True
        }, status=200)
    
    return JsonResponse({
        'success': False,
        'data': {
            'errors': form.errors
        },
        'message': 'Cannot register'
    }, status=522)
    
        