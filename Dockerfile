FROM php:7.3.13-fpm-buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y libz-dev gdb && \
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

COPY . /app/
