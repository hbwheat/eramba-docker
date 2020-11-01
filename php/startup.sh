#!/bin/sh

#things like

#set user owner

#set timezone
echo $TIMEZONE > /etc/timezone

# Modify php.ini settings
sed -i "s/memory_limit = .*/memory_limit = $PHP_MEM_LIMIT/" /etc/php7/php.ini
sed -i "s/post_max_size = .*/post_max_size = $PHP_POST_MAX_SIZE/" /etc/php7/php.ini
sed -i "s/file_uploads = .*/file_uploads = $PHP_FILE_UPLOADS/" /etc/php7/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = $PHP_UPLOAD_MAX_FILESIZE/" /etc/php7/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = $PHP_MAX_EXECUTION_TIME/" /etc/php7/php.ini
sed -i "s/allow_url_fopen = .*/allow_url_fopen = $PHP_ALLOW_URL_FOPEN/" /etc/php7/php.ini
sed -i "s/max_input_vars = .*/max_input_vars = $PHP_MAX_INPUT_VARS/" /etc/php7/php.ini
sed -i "s/max_input_time = .*/max_input_time = $PHP_MAX_INPUT_TIME/" /etc/php7/php.ini
sed -i "s/date.timezone = .*/date.timezone = $TIMEZONE/" /etc/php7/php.ini

# Modify for DB connection 
cp /var/www/localhost/htdocs/app/Config/database.php.default /var/www/localhost/htdocs/app/Config/database.php
sed -i "s/'host' => '.*',/'host' => 'db',/" /var/www/localhost/htdocs/app/Config/database.php
sed -i "s/'login' => '.*',/'login' => '$DB_LOGIN',/" /var/www/localhost/htdocs/app/Config/database.php
sed -i "s/'password' => '.*',/'password' => '$DB_PASSWORD',/" /var/www/localhost/htdocs/app/Config/database.php
sed -i "s/'database' => '.*',/'database' => '$DB_DATABASE',/" /var/www/localhost/htdocs/app/Config/database.php
sed -i "s/'prefix' => '.*',/'prefix' => '$DB_PREFIX',/" /var/www/localhost/htdocs/app/Config/database.php


#logging
ln -sf /dev/stdout /var/log/apache2/access.log
ln -sf /dev/stderr /var/log/apache2/error.log

#Set database up 

mysql --host=db --password=$DB_PASSWORD $DB_DATABASE < /var/www/localhost/htdocs/app/Config/db_scheme/c2.8.1.sql

tail /dev/null
#php-fpm