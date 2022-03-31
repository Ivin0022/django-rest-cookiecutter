echo >&2 'Migrating to Database'
python manage.py migrate --no-input

echo >&2 'collecting static files'
python manage.py collectstatic --no-input

echo >&2 'starting server'
/usr/local/bin/gunicorn config.wsgi:application -w 5 -b :$PORT --reload
