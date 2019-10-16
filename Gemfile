source 'https://rubygems.org'

ruby '2.5.1'

DECIDIM_VERSION = '0.16.1'

gem 'rails', '5.2.1'
gem 'decidim', DECIDIM_VERSION
gem 'sidekiq', '5.2.7'

gem 'puma'
gem 'uglifier'

gem 'letter_opener_web'
gem "sprockets", "~> 3.7.2"

group :development, :test do
  gem 'decidim-dev', DECIDIM_VERSION
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'webmock'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
