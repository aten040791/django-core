from django.utils.deprecation import MiddlewareMixin
from core.response.JsonResponseUtil import JsonResponseUtil
from core.auth.JWTUtil import JWTUtil
import jwt
import os
import multiprocessing
import json

SECRET_KEY = os.environ.get("JWT_SECRET", "")

print(f"LOADING MIDDLE_WARE {SECRET_KEY} - PID: {os.getpid()} - Process Name: {multiprocessing.current_process().name}")

class JWTMiddleware(MiddlewareMixin):
    def process_view(self, request, view_func, view_args, view_kwargs):
        if hasattr(view_func, '_skip_middlewares') and self.__class__.__name__ in view_func._skip_middlewares:
            return None
        jwt_token = request.headers.get('authorization', None)
        if not jwt_token:
            return JsonResponseUtil.Unauthorized()
        try:
            jwt_token = jwt_token.split(" ")[1]
            from ...event_management.controllers.user_controller import getById
            payload = JWTUtil.decode(jwt_token)
            user_id = payload['data']['id']
            user_response = getById(request, user_id)
            user = json.loads(user_response.content)
            if user.get('success'):
                return None
            else: 
                return JsonResponseUtil.Unauthenticated()
        except jwt.ExpiredSignatureError:
            return JsonResponseUtil.Unauthorized()
        except (jwt.DecodeError, jwt.InvalidTokenError):
            return JsonResponseUtil.Unauthenticated()
