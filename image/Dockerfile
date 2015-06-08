FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV MARIADB_VERSION 10.0
ENV MYSQL_ROOT_PASSWORD pass

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/sbin/my_init"]
