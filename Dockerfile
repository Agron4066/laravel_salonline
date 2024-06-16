FROM php:8.2-apache
# 必要なPHP拡張機能をインストール
RUN apt-get update && apt-get install -y \
        libzip-dev \
        zip \
        git \
    && docker-php-ext-install \
        pdo pdo_mysql zip
# Composerをインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Laravelが期待するディレクトリにApacheのドキュメントルートを設定
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf
WORKDIR /var/www/html