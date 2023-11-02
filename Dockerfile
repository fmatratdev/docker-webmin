FROM debian:jessie
MAINTAINER Sita Liu <chsliu+docker@gmail>


RUN echo root:pass | chpasswd && \
	curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh \
	sh setup-repos.sh \
	apt-get install webmin --install-recommends \
	apt-get clean


ENV LC_ALL C.UTF-8

EXPOSE 10000

VOLUME ["/etc/webmin"]

CMD /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log
