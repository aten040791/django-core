from django.urls import path
from .controllers import auth_controller, event_controller, participant_controller


urlpatterns = [
    path('api/auth/login', auth_controller.login),
    path('api/auth/register', auth_controller.register),
    path('api/events/', event_controller.all),
    path('api/events/<int:event_id>', event_controller.show),
    path('api/events/show', event_controller.show_querystring),
    path('api/events/store', event_controller.store),
    path('api/events/store_fillable', event_controller.store_fillable),
    path('api/events/<int:event_id>/update', event_controller.update),
    path('api/events/<int:event_id>/delete', event_controller.delete),
    path('api/events/<int:event_id>/relationship', event_controller.show_with_relationship),
    path('api/participant/', participant_controller.all),
    path('api/participant/store', participant_controller.store),
    path('api/participant/<int:participant_id>', participant_controller.show),
    path('api/participant/<int:participant_id>/delete', participant_controller.delete),
    path('api/participant/<int:participant_id>/update', participant_controller.update),
    path('api/participant/register_event', participant_controller.register_event)
]