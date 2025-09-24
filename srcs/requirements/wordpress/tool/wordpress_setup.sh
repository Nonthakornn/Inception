#!/bin/bash

wp core download --allow-root

#TODO Delete this late we just php-cli to load the UI for testing
exec php -S 0.0.0.0:7000 -t /var/www/html

# php-fpm
# exec php-fpm8.2 -F


# sleep infinity



