#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install --without development test
bundle exec rake db:migrate:reset
bundle exec rake db:seed