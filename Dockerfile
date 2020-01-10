FROM php:7.3.13-fpm-buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y libz-dev gdb git-core unzip && \
    apt-get clean

RUN pecl channel-update pecl.php.net

RUN pecl install grpc-1.26.0 && \
    docker-php-ext-enable grpc

ENV VERSION=3.11.2

ENV CFLAGS='-g -O0'

## we want to keep source for gdb inspection
RUN cd /usr/src && \
    curl -L -O https://pecl.php.net/get/protobuf-${VERSION}.tgz && \
    tar -zxvf protobuf-${VERSION}.tgz && \
    cd protobuf-${VERSION} && \
    phpize && ./configure && make && make install && \
    docker-php-ext-enable protobuf

RUN curl -sS https://getcomposer.org/installer | php && \
    mv /var/www/html/composer.phar /usr/bin/composer && \
    chmod 755 /usr/bin/composer

RUN cd /usr/src && \
    git clone https://github.com/googleapis/google-cloud-php.git && \
    cd google-cloud-php && \
    git checkout v0.122.0

RUN cd /usr/src/google-cloud-php/ && \
    composer install

COPY test.sh /app/

