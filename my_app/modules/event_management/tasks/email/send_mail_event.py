from my_app.celery import app
from modules.core.controllers.email_controller import send_email

@app.task(bind=True)
def task_send_mail_event(self, html_template, context):
        send_email(html_template, context)