import redis
from my_app.settings import REDIS_HOST, REDIS_PORT

redis = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, db=1)