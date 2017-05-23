#!/bin/sh
bundle exec sidekiq -d -L "/var/log/sidekiq.log" -e production -C config/sidekiq.yml