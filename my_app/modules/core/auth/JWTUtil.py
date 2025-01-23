import jwt
import datetime
from my_app.settings import SECRET_KEY
from django.utils.timezone import now

class JWTUtil:
    @staticmethod
    def encode(data, milliseconds):
        current_time = now()
        payload = {
            'data': data,
            'iat': current_time,
            'exp': current_time + datetime.timedelta(milliseconds=milliseconds), # 5 minutes
        }
        return jwt.encode(payload=payload, key=SECRET_KEY, algorithm='HS256')
    
    @staticmethod
    def decode(token):
        return jwt.decode(jwt=token, key=SECRET_KEY, algorithms='HS256')