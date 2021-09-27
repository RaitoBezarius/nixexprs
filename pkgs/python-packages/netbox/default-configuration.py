import environ
import os

env = environ.Env()

env.read_env(env.str('ENV_PATH', '.env'))
ALLOWED_HOSTS = env('ALLOWED_HOSTS')
DATABASE = env.db()
REDIS = {
  'tasks': env.cache_url('REDIS_TASKS_URL'),
  'caching': env.cache()
}

SECRET_KEY = env('SECRET_KEY')

# templates/ and project-static/ will be under netbox package.
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# for external collection.
STATIC_ROOT = env('STATIC_ROOT')
