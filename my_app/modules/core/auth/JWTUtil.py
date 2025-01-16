import jwt
import datetime
from my_app.settings import SECRET_KEY

class JWTUtil:
    @staticmethod
    def encode(data, milliseconds):
        current_time = datetime.datetime.now()
        payload = {
            'data': data,
            'iat': current_time,
            'exp': current_time + datetime.timedelta(milliseconds=milliseconds), # 5 minutes
        }
        return jwt.encode(payload=payload, key=SECRET_KEY, algorithm='HS256')
    
    @staticmethod
    def decode(token):
        return jwt.decode(jwt=token, algorithms='HS256')