# pull official base image
FROM python:3.8-alpine
#
# # set work directory
WORKDIR /usr/src/app
#
# # set environment varibles
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1
#
# copy project
COPY ./src /usr/src/app/

# install dependencies
RUN apk update && \
    apk add --virtual build-deps gcc python3-dev musl-dev jpeg-dev libjpeg  libxslt-dev && \
    apk add postgresql-dev
RUN pip install --upgrade pip
RUN pip install gunicorn
RUN pip install -r requirements.txt

