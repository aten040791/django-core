from ..models import api_user, auth_permission
import jwt
from my_app import settings 
from modules.core.response.JsonResponseUtil import JsonResponseUtil
from modules.core.auth.JWTUtil import JWTUtil

def have_permission():
    def decorator(view_func):
        def _wrapped_view(request, *args, **kwargs):
            try:
                authorization = request.headers.get('Authorization')
                if authorization and authorization.startswith('Bearer '):
                    access_token = authorization.split(' ')[1]  # Extract token after "Bearer "
                    # decode access token
                    data = JWTUtil.decode(token=access_token)
                    user_id = data['data']['id']
                    permission_ids = list(api_user.AuthUserApi.objects.get(id = user_id).permissions.all().values_list('id', flat=True))
                    # Get current log path and method call
                    path = request.path
                    method = request.method
                    permission = auth_permission.Permission.objects.get(method = method, route = path)      
                    if not permission:
                        return JsonResponseUtil.NotFound()
                    permission_id = permission.id
                    if permission_id not in permission_ids:
                        return JsonResponseUtil.NotFound()
                    # Check path against permission
                    response = view_func(request, *args, **kwargs)
                    return response  # Ensure an HttpResponse is returned                    
            except (api_user.AuthUserApi.DoesNotExist, auth_permission.Permission.DoesNotExist):
                return JsonResponseUtil.NotFound()
            except jwt.ExpiredSignatureError:
                return JsonResponseUtil.Unauthorized('Token expired')
            except jwt.InvalidSignatureError:
                return JsonResponseUtil.Unauthorized('Invalid signature')
        return _wrapped_view
    return decorator
