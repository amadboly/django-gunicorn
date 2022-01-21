FROM python:3.8.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY ./mydjpro /myapp

WORKDIR /myapp

COPY ./entrypoint.sh /

ENTRYPOINT ["sh","/entrypoint.sh"]
