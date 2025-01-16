from django.db import models
from django.contrib.auth.hashers import check_password, make_password
from .auth_permission import Permission

class AuthUserApiManager(models.Manager):
    def authenticate(self, email, password):
        try:
            user = self.get(email=email)  # Get the user by email
            if check_password(password, user.password):  # Compare raw password with hashed
                return user  # Return the user if the password matches
            else:
                return None  # Invalid password
        except self.model.DoesNotExist:
            return None  # User not found

class AuthUserApi(models.Model):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=150, null=False, unique=True)
    password = models.CharField(max_length=100, null=False)
    permissions = models.ManyToManyField(Permission, db_table='auth_user_permission', related_name='permissions')
    objects = AuthUserApiManager()
    
    class Meta:
        db_table = 'api_users'
        
    # Calling save() directly on model to hash password
    def save(self, *args, **kwargs):
        if self.password:
            self.password = make_password(password=self.password)
        super().save(args, kwargs)
        