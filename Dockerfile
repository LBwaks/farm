FROM  python:3.12.0a1-alpine3.16

WORKDIR /farm
ENV PYTHONBUFFERED 1
COPY requirements.txt requirements.txt



COPY . .
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install -r requirements.txt
# RUN apk del .tmp-build-deps

CMD ['python3','manage.py','runserver','0.0.0.0:8000']
