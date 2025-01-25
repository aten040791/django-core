# Celery
1. Khởi worker: celery -A my_app worker --loglevel=info
2. Khởi tạo worker cho queue riêng biệt: celery -A my_app worker --loglevel=info --queues=[queue_name] -hostname=worker1@[host_name]
3. Khởi tạo nhiều worker cùng lúc: celery -A my_app multi start 2 -Q:1 [queue_name_1] -Q:2 [queue_name_2]
4. Setup sử dụng 1 số lượng tối đa tiến trình song song: celery -A my_app worker --loglevel=info -concurrency=8
5. Kiểm tra trạng thái workers: celery -A my_app inspect active