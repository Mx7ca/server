#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )"

# TODO: this chown breaks the ownership on the development machine
chown -R 33 $DIR

git config --global --add safe.directory $DIR
git config --global --add safe.directory $DIR/3rdparty

cd $DIR/
git submodule update --init

# Codespace config
cp .devcontainer/codespace.config.php config/codespace.config.php

# Nextcloud installation
# TODO: the first setup works, but afterwards APCu has issues:
# Memcache \OC\Memcache\APCu not available for local cache (Is the matching PHP module installed and enabled?
# TODO: data directory inside webroot -> do we want that?
sudo -uwww-data php $DIR/occ maintenance:install --admin-pass admin