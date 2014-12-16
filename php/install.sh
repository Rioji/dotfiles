#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE}")";

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

brew install php54 php54-apc php54-xdebug

cat <<EOF >> /usr/local/etc/php/5.4/php.ini
date.timezone = "Europe/Paris"
display_errors = On
display_startup_errors = On
error_reporting = -1
log_errors = On
EOF

cat <<EOF >> /usr/local/etc/php/5.4/conf.d/ext-xdebug.ini
xdebug.remote_enable = 1
xdebug.remote_connect_back = 1
xdebug.remote_handler = "dbgp"
xdebug.remote_port = 9000
xdebug.max_nesting_level = 250
EOF

brew install composer
composer selfupdate

composer global require "phpunit/phpunit=4.4.*"

exit 0