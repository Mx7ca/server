#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" >/dev/null 2>&1 && pwd )"

chown -R 33 $DIR

git config --global --add safe.directory $DIR
git config --global --add safe.directory $DIR/3rdparty

cd $DIR/
git submodule update --init

# Codespace config
cp .devcontainer/codespace.config.php config/codespace.config.php

# Nextcloud installation
sudo -uwww-data php $DIR/occ maintenance:install --admin-pass admin