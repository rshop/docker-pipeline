
FROM rshop/swoole:8.3-mssql

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
    && curl -sSL https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/latest/download/php-cs-fixer.phar -o /usr/bin/php-cs-fixer \
    && chmod +x /usr/bin/php-cs-fixer \
    && rm -Rf /root/.composer/cache
