# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '5.2.1'

DECIDIM_VERSION = '0.16.1'

gem 'decidim', DECIDIM_VERSION

gem 'letter_opener_web'
gem 'puma'
gem 'sidekiq', '5.2.7'
gem 'sidekiq-cron'
gem 'sprockets', '~> 3.7.2'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'webmock'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
