from django.http.response import JsonResponse

class JsonResponseUtil(JsonResponse):
    
    @staticmethod
    def NotFound(message = 'Entity not found'):
        return JsonResponse({
            'success': False,
            'data': None,
            'status': 404,
            'message': message
        }, status=404)
    
    @staticmethod
    def Unauthenticated(message = 'Unauthenticated'):
        return JsonResponse({
            'success': False,
            'data': None,
            'status': 401,
            'message': message
        }, status=401)
    
    @staticmethod
    def Unauthorized(message = 'Unauthorized'):
        return JsonResponse({
            'success': False,
            'data': None,
            'status': 403,
            'message': message
        }, status=403)
    
    @staticmethod
    def Success(data_as_dict, message = 'Ok'):
        return JsonResponse({
            'success': True,
            'data': data_as_dict,
            'status': 200,
            'message': message
        }, status=200)
        
    @staticmethod
    def Deleted(message = 'Deleted'):
        return JsonResponse({
            'success': True,
            'data': None,
            'status': 204,
            'message': message
        }, status=204)
    
    @staticmethod
    def ValidationFailed(errors, message = 'Validation failed'):
        return JsonResponse({
            'success': False,
            'data': {
                'errors': errors
            },
            'status': 522,
            'message': message
        }, status=522)
    
    @staticmethod
    def Error(message='Failed'):
        return JsonResponse({
            'success': False,
            'data': None,
            'status': 400,
            'message': message
        }, status=400)
    
    @staticmethod
    def AlreadyExist(message='Entity already exists'):
        return JsonResponse({
            'success': False,
            'data': None,
            'status': 400,
            'message': message
        }, status=400)
    