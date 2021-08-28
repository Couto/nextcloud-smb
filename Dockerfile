FROM nextcloud:22.1.0-apache

RUN apt-get update && \
  apt-get install -y procps smbclient supervisor && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /
COPY smb.conf /etc/samba/smb.conf

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]

