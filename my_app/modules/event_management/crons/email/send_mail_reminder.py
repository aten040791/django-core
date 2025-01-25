from modules.core.helpers.email_helper import send_email
from models import Participant
# TODO
def send_mail_reminder():
    html_template = 'reminder_event.html'
    context = {
        'to_email': 'namdp.work@gmail.com',
        'subject': "[Event Management] NHẮC BẠN ĐỪNG QUÊN",
        'attachments': {},
        'user_name': 'Dao Phuong Nam',
        'event_name': 'Concert Ha Anh Tuan',
    }
    send_email(html_template, context)