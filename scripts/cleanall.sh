#!/bin/sh

# Show what we execute
set -x

cd /var/www/magento2/

# Wipe out all caches
/bin/rm -rf var/cache/*
/bin/rm -rf var/page_cache/*
/bin/rm -rf var/view_preprocessed/*
# change Webwolk with your vendor theme name
/bin/rm -rf pub/static/frontend/Webwolk




