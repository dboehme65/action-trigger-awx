FROM python:3-alpine
ENV PYTHONUNBUFFERED=1
RUN apk update \
  && apk upgrade \
  && apk add bash \
  && rm -rf /var/cache/*/*

ADD requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
