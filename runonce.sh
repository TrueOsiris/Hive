#!/bin/bash

# Run once 

# apache2 & php7
a2enmod php7.0 rewrite
chown -R www-data:www-data /synced/www /var/log/apache2
sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/synced\/www\//' /etc/apache2/sites-enabled/000*.conf
sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini
sed -i 's/\;extension=php_mysqli.dll/extension=php_mysqli.dll/' /etc/php/7.0/apache2/php.ini
rm -R /var/www/html/
echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
