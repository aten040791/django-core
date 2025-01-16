from functools import wraps
def skip_middleware(arr_middleware_name):
    def decorator(view_func):
        if not hasattr(view_func, '_skip_middlewares'):
                view_func._skip_middlewares = set()
                view_func._skip_middlewares.update(arr_middleware_name)
        @wraps(view_func)
        def wrapped_view(*args, **kwargs):
            return view_func(*args, **kwargs)
        return wrapped_view
    return decorator