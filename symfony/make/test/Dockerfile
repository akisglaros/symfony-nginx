FROM php:7.0.27-cli

RUN apt-get update -y && apt-get install -y libbz2-dev libcurl4-openssl-dev libxml2-dev \
libfreetype6-dev libjpeg62-turbo-dev libpng12-dev redis-server

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install bcmath bz2 calendar
RUN docker-php-ext-install soap zip xml
RUN docker-php-ext-install pdo_mysql

RUN mkdir -p /usr/src/php/ext/redis \
&& curl -L https://github.com/phpredis/phpredis/archive/3.0.0.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
&& echo 'redis' >> /usr/src/php-available-exts \
&& docker-php-ext-install redis

RUN pecl install mongodb

RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini
