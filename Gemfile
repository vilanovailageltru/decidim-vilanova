# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.2'

DECIDIM_VERSION = { git: 'https://github.com/decidim/decidim.git', branch: 'release/0.24-stable' }

gem 'decidim', DECIDIM_VERSION
gem 'decidim-verify_wo_registration', git: "https://github.com/CodiTramuntana/decidim-verify_wo_registration.git"
gem 'decidim-file_authorization_handler', git: "https://github.com/MarsBased/decidim-file_authorization_handler.git"
gem 'decidim-term_customizer', git: "https://github.com/mainio/decidim-module-term_customizer.git"

gem 'rails', '~> 5.2.5'
gem 'puma'
gem 'sidekiq', '6.4.0'
gem 'sidekiq-cron'
# Lock sprockets until decidim supports version 4.
gem 'sprockets', '~> 3.7.2'
gem 'geocoder', '~> 1.6.1'
gem 'uglifier'

gem "httparty", "~> 0.18.1"

gem "execjs", "~> 2.7.0"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'faker'
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
