# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '5.2.1'

DECIDIM_VERSION = { git: 'https://github.com/decidim/decidim.git', branch: '0.18-stable' }

gem 'decidim', DECIDIM_VERSION

gem 'letter_opener_web'
gem 'puma'
gem 'sidekiq', '5.2.7'
gem 'sidekiq-cron'
# Lock sprockets until decidim supports version 4.
gem 'sprockets', '~> 3.7.2'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
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
