#!/bin/zsh

ver=$1

if [ -z $ver ]; then
    echo "No version specified"
    exit 1
fi

echo "Setting environment variables"
PHP_BUILD_CONFIGURE_OPTS="--with-zlib=$(brew --prefix zlib) --with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-kerberos=$(brew --prefix krb5) --without-tidy"

PKG_CONFIG_PATH=/usr/local/opt/krb5/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libedit/lib/pkgconfig:/usr/local/opt/oniguruma/lib/pkgconfig

PHP_BUILD_INSTALL_EXTENSION="memcached=3.1.5"

echo "Environment set:"
echo "PHP_BUILD_CONFIGURE_OPTS: $PHP_BUILD_CONFIGURE_OPTS"
echo "PKG_CONFIG_PATH: $PKG_CONFIG_PATH"
echo "PHP_BUILD_INSTALL_EXTENSION: $PHP_BUILD_INSTALL_EXTENSION"

phpenv install -v $ver
