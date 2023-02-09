# php81-bgd-alpine
# Light Container PHP image with Test Blue/Green Application
FROM alpine:latest
MAINTAINER silvinux <silvinux7@gmail.com>
# php81, apache and tools
RUN apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/main add \
    icu-libs \
    &&apk --no-cache --repository https://dl-cdn.alpinelinux.org/alpine/edge/community add \
    # Current packages don't exist in other repositories
    libavif \
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted gnu-libiconv \
    # Packages
    vim \
    bash \
    apache2 \
    curl \
    php81 \
    php81-apache2 \
    php81-dev \
    php81-common \
    php81-gd \
    php81-xmlreader \
    php81-bcmath \
    php81-ctype \
    php81-curl \
    php81-exif \
    php81-iconv \
    php81-intl \
    php81-mbstring \
    php81-opcache \
    php81-openssl \
    php81-pcntl \
    php81-phar \
    php81-session \
    php81-xml \
    php81-xsl \
    php81-zip \
    php81-zlib \
    php81-dom \
    php81-fpm \
    php81-sodium \
    # Iconv Fix
    && mkdir /htdocs && rm /var/www/localhost/htdocs/index.html

ADD files/application /var/www/localhost/htdocs
ADD files/php-config/htaccess /var/www/html/.htaccess
ADD files/php-config/gd.ini /etc/php81/conf.d

RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/httpd.conf \
  && mkdir /run/php-fpm8 \
  && chgrp -R 0 /var/log/apache2 /var/run/apache2 /var/log/php81 /run/php-fpm8 \
  && chmod -R g=u /var/log/apache2 /var/run/apache2 /var/log/php81 /run/php-fpm8

EXPOSE 8080
USER 1001
CMD php-fpm8 & httpd -D FOREGROUND
