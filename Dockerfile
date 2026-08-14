
FROM rshop/swoole:8.4-mssql

RUN apk update \
    && apk add --no-cache \
        bash \
        git \
        gnupg \
        openssh \
        unzip \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && curl -sSL https://github.com/phpstan/phpstan/releases/latest/download/phpstan.phar -o /usr/bin/phpstan \
    && chmod +x /usr/bin/phpstan \
    && composer global require friendsofphp/php-cs-fixer \
    && ln -s /root/.composer/vendor/bin/php-cs-fixer /usr/bin/php-cs-fixer \
    && composer global require rector/rector \
    && ln -s /root/.composer/vendor/bin/rector /usr/bin/rector \
    && rm -Rf /root/.composer/cache
