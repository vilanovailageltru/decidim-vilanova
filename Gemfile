# frozen_string_literal: true

DECIDIM_VERSION = { git: 'https://github.com/decidim/decidim', tag: 'v0.28.4' }.freeze

source "https://rubygems.org"

ruby '3.1.4'


gem "decidim", DECIDIM_VERSION
gem "decidim-verify_wo_registration", git: "https://github.com/PopulateTools/decidim-verify_wo_registration.git", branch: "improve-ui-texts-redesign"
gem "decidim-file_authorization_handler", git: "https://github.com/PopulateTools/decidim-file_authorization_handler.git", branch: "upgrade/redesign"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer.git", branch: "main"
gem "decidim-decidim_awesome", git: "https://github.com/decidim-ice/decidim-module-decidim_awesome.git", branch: "users_autoblock"

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
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
end

group :production do
  gem 'sentry-raven'
end
