##
## MariaDB 10.0
##
FROM centos:7
MAINTAINER "cytopia" <cytopia@everythingcli.org>


##
## Labels
##
LABEL \
	name="cytopia's MariaDB 10.0 Image" \
	image="mariadb-10.0" \
	vendor="cytopia" \
	license="MIT" \
	build-date="2016-11-03"


##
## Bootstrap Scipts
##
COPY ./scripts/docker-install.sh /
COPY ./scripts/docker-entrypoint.sh /


##
## Install
##
RUN /docker-install.sh


##
## Ports
##
EXPOSE 3306


##
## Volumes
##
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
VOLUME /var/sock/mysqld
VOLUME /etc/mysql/conf.d


##
## Entrypoint
##
ENTRYPOINT ["/docker-entrypoint.sh"]
