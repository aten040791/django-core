from ..models import AuthUserApi
from django.http import JsonResponse
def getById(request, id):
    try:
        user = AuthUserApi.objects.get(id=id)
        return JsonResponse({
            'data': {
                'id': user.id,
                'email': user.email
            },
            'code': 200,
            'success': True,
            'message': 'ok'
        })
    except AuthUserApi.DoesNotExist:
        return JsonResponse({
            'code': 400,
            'success': False,
            'message': 'Not found'
        })
