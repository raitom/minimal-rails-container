#!/bin/bash
cd /home/edenapi && git pull
cd /home/edenapi && bundle install --without development test
cd /home/edenapi && RAILS_ENV=production bundle exec rake db:migrate
cd /home/edenapi && foreman start -f Procfile.production
