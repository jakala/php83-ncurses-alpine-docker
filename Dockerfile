FROM php:8.3-cli-alpine3.19

RUN apk upgrade --no-cache

RUN apk add --update autoconf build-base linux-headers php83-dev ncurses ncurses-dev ncurses-doc ncurses-static ncurses-terminfo ncurses-terminfo-base ncurses-libs --repository=http://dl-cdn.alpinelinux.org/alpine/v3.19/main

RUN cd ~/ && \
    wget https://github.com/OOPS-ORG-PHP/mod_ncurses/archive/refs/heads/master.zip  && \
    unzip ~/master.zip && \
    cd mod_ncurses-master && \
    phpize && \
    ./configure --with-php-config=/usr/local/bin/php-config && \
    make && \
    make install && \
    docker-php-ext-enable ncurses && \
    rm -Rf ~/master ~/ncurses-1.0.2 ~/channels.xml
