import qrcode
from django.core.files.storage import FileSystemStorage
from io import BytesIO

def generate(data, size=10, border=4):
    qr = qrcode.QRCode(
        version=None,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=size,
        border=border
    )
    qr.add_data(data)
    qr.make(fit=True)

    qr_image = qr.make_image(fill_color="black", back_color="white")
    img_name = f"qr_code_{data.get('email')}.png"
    qr_buffer = BytesIO()
    qr_image.save(qr_buffer, format='PNG')
    qr_buffer.seek(0)
    file_storage = FileSystemStorage(location='modules/event_management/storage/event_qr_codes', base_url='event_management/event_qr_codes')
    file_storage.save(img_name, qr_buffer)
    return img_name