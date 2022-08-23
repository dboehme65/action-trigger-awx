FROM python:3-alpine

ADD requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
