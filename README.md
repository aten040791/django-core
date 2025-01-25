# Celery
1. Khởi tạo worker: celery -A my_app worker --loglevel=info
2. Khởi tạo worker cho queue riêng biệt: celery -A my_app worker --loglevel=info --queues=[queue_name] --hostname=worker1@[host_name]
3. Khởi tạo nhiều worker cùng lúc: celery -A my_app multi start 2 -Q:1 [queue_name_1] -Q:2 [queue_name_2]
4. Setup tối đa số lượng tiến trình xử lý song song: celery -A my_app worker --loglevel=info --concurrency=8
5. Kiểm tra trạng thái workers: celery -A my_app inspect active