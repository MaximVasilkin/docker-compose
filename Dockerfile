FROM python:3.8

ENV SECRET_KEY=4f1mexjj7i8-7uamzz#r^5dv5218)a7#s%yq^e3afmo7k_5 \
    DEBUG=False \
    ALLOWED_HOSTS=*

WORKDIR /project

COPY ./Django_project .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD python3 manage.py collectstatic && \
    python3 manage.py makemigrations && \
    python3 manage.py migrate --run-syncdb && \
    gunicorn stocks_products.wsgi -b 0.0.0.0:8000
