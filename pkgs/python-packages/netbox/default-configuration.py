import environ
import os

env = environ.Env(
  ALLOWED_HOSTS=(list, []),
  PLUGINS=(list, [])
)

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
MEDIA_ROOT = env('MEDIA_ROOT')

PLUGINS = @nixPlugins@

# for each plugin, configure each plugin configuration using some mechanism.
