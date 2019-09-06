#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
export RAILS_ENV=test
apt-get update && apt-get install -y tzdata
gem install bundler -v 2.0.1
# install
bundle install --jobs=3 --retry=3
# before_script
cp config/database.yml.$DB config/database.yml
bundle exec rake db:create db:migrate
# script
bundle exec rake
