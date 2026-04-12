FROM php:8.4-apache

# System dependencies
RUN apt-get update && apt-get install -y \
    libbz2-dev \
    libicu-dev \
    libonig-dev \
    libpq-dev \
    libxml2-dev \
    libsqlite3-dev \
    libtidy-dev \
    libxslt1-dev \
    libzip-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-configure zip
RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg
RUN docker-php-ext-install -j$(nproc) \
    bz2 \
    intl \
    mbstring \
    mysqli \
    pgsql \
    soap \
    xsl \
    zip \
    gd \
    opcache
