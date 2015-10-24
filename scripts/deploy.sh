#!/bin/sh

# Show what we execute
set -x

cd /var/www/magento2/

# Wipe out all caches
/bin/rm -rf var/*

# run composer install
composer install

# install sample data
# TODO make it optional with a flag
#composer config repositories.magento composer http://packages.magento.com
#composer require magento/sample-data:1.0.0-beta --dev
cd /var/www/
git clone https://github.com/magento/magento2-sample-data.git
cd /var/www/magento2-sample-data/dev/tools
php -f build-sample-data.php -- --ce-source="/var/www/magento2/"
cd /var/www/magento2/

# Set up, rebuilding database from scratch.
php bin/magento setup:install \
	--cleanup-database \
        --db-host=localhost \
        --db-name=magento \
        --db-user=magento \
        --db-password=secret \
        --backend-frontname=admin \
        --base-url=http://192.168.254.91/ \
        --language=en_US \
        --timezone=America/Los_Angeles \
        --currency=USD \
        --admin-lastname=Smith \
        --admin-firstname=John \
        --admin-email=john.smith@example.com \
        --admin-user=admin \
        --admin-password=admin123 \
        --use-secure=0
