#!/bin/bash
gem install sinatra
if [ "$RACK_ENV" == "production" ];
then
  bundle install --without development test
  bundle exec unicorn -p 80
else
  bundle install
  if [ "$RACK_ENV" == "test" ];
  then
    rspec
  else
    bundle install
    bundle exec 'rerun -b -- unicorn -p 80'
  fi
fi


