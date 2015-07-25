#!/bin/bash
cd /usr/edenapi && git pull
cd /usr/edenapi && bundle install --without development test
cd /usr/edenapi && RAILS_ENV=production bundle exec rake db:migrate
cd /usr/edenapi && foreman start -f Procfile.production
