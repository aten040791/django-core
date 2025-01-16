from django.http import JsonResponse
from ..models import api_user, auth_permission
import jwt
from my_app import settings 
from modules.core.response.JsonResponseUtil import JsonResponseUtil

def have_permission():
    def decorator(view_func):
        def _wrapped_view(request, *args, **kwargs):
            try:
                authorization = request.headers['Authorization']
                if authorization and authorization.startswith('Bearer '):
                    access_token = authorization.split(' ')[1]  # Extract token after "Bearer "
                    # decode access token
                    data = jwt.decode(access_token, settings.JWT_SECRET, algorithms='HS256')
                    user_id = data['data']['id']
                    permission_ids = list(api_user.AuthUserApi.objects.get(id = user_id).permissions.all().values_list('id', flat=True))
                    # Get current log path and method call
                    path = request.path
                    method = request.method
                    permission = auth_permission.Permission.objects.get(method = method, route = path)
                    
                    if not permission:
                        return 
                    permission_id = permission.id
                    if permission_id not in permission_ids:
                        return JsonResponseUtil.NotFound
                    # Check path against permission
                    response = view_func(request, *args, **kwargs)
                    return response  # Ensure an HttpResponse is returned
            except (api_user.AuthUserApi.DoesNotExist, auth_permission.Permission.DoesNotExist):
                return JsonResponseUtil.NotFound()
            except jwt.ExpiredSignatureError:
                return JsonResponseUtil.Unauthorized('Token expired')
        return _wrapped_view
    return decorator
