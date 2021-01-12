# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.1'

DECIDIM_VERSION = { git: 'https://github.com/decidim/decidim.git', tag: 'v0.23.1' }

gem 'decidim', DECIDIM_VERSION

gem 'rails', '~> 5.2.4.4'
gem 'puma'
gem 'sidekiq', '5.2.7'
gem 'sidekiq-cron'
# Lock sprockets until decidim supports version 4.
gem 'sprockets', '~> 3.7.2'
gem 'geocoder', '~> 1.6.1'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'faker', "~> 1.9.6"
  gem 'letter_opener_web'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
end

group :production do
  gem 'sentry-raven'
end
