import json
from ..forms.auth_form import AuthLoginForm, AuthRegisterForm
from ..models import AuthUserApi
from modules.core.response.JsonResponseUtil import JsonResponseUtil
from modules.core.auth.JWTUtil import JWTUtil

def login(request):
    form = AuthLoginForm(json.loads(request.body))  
    if form.is_valid():
        # Get data after validation
        email = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password')

        # Check against db
        user = AuthUserApi.objects.authenticate(email, password)
        if not user:
            return JsonResponseUtil.NotFound()
            
        jwt_access_token = JWTUtil.encode({
                'id': user.id,
                'email': user.email
            },5 * 60 * 1000  # 5 minutes
        )
            
        jwt_refresh_token = JWTUtil.encode({
                'id': user.id,
                'email': user.email
            }, 7 * 24 * 3600 * 1000) # 7 days
        return JsonResponseUtil.Success({
                'access_token': jwt_access_token,
                'refresh_token': jwt_refresh_token,
            })
    return JsonResponseUtil.ValidationFailed(form.errors)


def register(request):
    form = AuthRegisterForm(json.loads(request.body))
    if form.is_valid():
        api_user = form.save(commit=True)   # Save to database directly
        jwt_access_token = JWTUtil.encode({
                'id': api_user.id,
                'email': api_user.email
            }, 5 * 60 * 1000)
        
        jwt_refresh_token = JWTUtil.encode({
                'id': api_user.id,
                'email': api_user.email
            }, 7 * 24 * 3600 * 1000) # 7 days
        
        return JsonResponseUtil.Success({
            'access_token': jwt_access_token,
            'refresh_token': jwt_refresh_token
        })
    return JsonResponseUtil.ValidationFailed(form.errors)
    
        