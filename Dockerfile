FROM ubuntu:20.04 as baseimage
ENV TZ=Europe
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y wordpress php libapache2-mod-php net-tools curl

COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
COPY config-localhost.php /etc/wordpress/config-localhost.php

EXPOSE 80

COPY bootstrap.sh /
RUN chmod +x /bootstrap.sh
CMD ["/bootstrap.sh"]
