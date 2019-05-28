#!/bin/sh

# Check DBs are initialized.
until nc -z -v -w30 db 3306
do
	echo "Waiting for database connection..."
  	# wait for 5 seconds before check again
  	sleep 5
done

HOME_ROOT="/home/serveruser/www/backend"

# Fix permissions.
cd $HOME_ROOT
chown -R serveruser:serveruser .
chmod 755 $HOME_ROOT/web/sites/default

composer install
drush site:install -y --site-name=Backend minimal --account-name=admin --account-pass=123456 --config-dir='/home/serveruser/www/backend/config/sync' --db-url='mysql://'"$MYSQL_USER"':'"$MYSQL_PASSWORD"'@db/'"$MYSQL_DATABASE"''

# Change settings path.
cd $HOME_ROOT/web/sites/default
chmod 755 .
chmod 644 settings.php
sed -i -e"s/^\$config_directories.*sync.*=.*/\$config_directories['sync'] = '\/home\/serveruser\/www\/backend\/config\/sync';/g" settings.php
chmod 555 .
chmod 444 settings.php

# Import settings.
drush cr
drush cim -y

# Delete old folder.
rm -rf $HOME_ROOT/configuration
