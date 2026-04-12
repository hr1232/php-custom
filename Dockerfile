FROM php:8.4-apache

# System dependencies
RUN apt-get update && apt-get install -y \
    libbz2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libonig-dev \
    libpq-dev \
    libxml2-dev \
    libsqlite3-dev \
    libtidy-dev \
    libxslt1-dev \
    libzip-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install -j$(nproc) \
    bz2 curl ftp fileinfo intl mbstring mysqli \
    pgsql soap sqlite3 tidy xsl zip
