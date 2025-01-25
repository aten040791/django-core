from my_app.celery import app
from modules.core.helpers.email_helper import send_email

@app.task(bind=True)
def task_send_mail(self, html_template, context):
        send_email(html_template, context)