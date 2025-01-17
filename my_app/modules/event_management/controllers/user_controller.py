from ..models import AuthUserApi
from core.response.JsonResponseUtil import JsonResponseUtil

def getById(request, id):
    try:
        user = AuthUserApi.objects.get(id=id)
        return JsonResponseUtil.Success({
                'id': user.id,
                'email': user.email
            })
    except AuthUserApi.DoesNotExist:
        return JsonResponseUtil.NotFound()
