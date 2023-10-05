FROM python:3.11-slim-bullseye
ENV PYTHONUNBUFFERED=1
RUN apt update \
  && apt upgrade -y \
  && apt install -y bash \
  && apt install -y curl \
  && apt install -y openssl \
  && apt install -y ca-certificates  \
  && rm -rf /var/cache/*/*
RUN  pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi  
ADD requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
