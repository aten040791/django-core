import os
import importlib

def load_middlewares(base_dir):
    middlewares = []
    for module_name in os.listdir(base_dir):
        module_path = os.path.join(base_dir, module_name, 'middlewares')
        if os.path.isdir(module_path):
            for file in os.listdir(module_path):
                if file.endswith('_middleware.py'):
                    middleware_module = f'modules.{module_name}.middlewares.{file[:-3]}'
                    try:
                        imported_module = importlib.import_module(middleware_module)
                        for attr_name in dir(imported_module):
                            attr = getattr(imported_module, attr_name)
                            if isinstance(attr, type) and attr_name.endswith('Middleware'):
                                middlewares.append(f'{middleware_module}.{attr_name}')
                    except ImportError as e:
                        print(f"Failed to import middleware {middleware_module}: {e}")
    return middlewares
