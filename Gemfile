# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

DECIDIM_VERSION = "0.27.4"

gem "decidim", DECIDIM_VERSION
gem "decidim-verify_wo_registration", git: "https://github.com/PopulateTools/decidim-verify_wo_registration.git", branch: "improve-ui-texts"
gem "decidim-file_authorization_handler", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git", tag: "v0.27.1.5"
# gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer.git", branch: "release/0.26-stable"

gem 'puma'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'uglifier'
gem 'faker'

gem "httparty", "~> 0.18.1"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'letter_opener_web'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
end

group :production do
  gem 'sentry-raven'
end
