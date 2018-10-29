source 'https://rubygems.org'

ruby '2.4.0'
DECIDIM_VERSION = '0.7.4'

gem 'decidim', DECIDIM_VERSION
gem 'sidekiq'

gem 'puma'
gem 'uglifier'

gem 'letter_opener_web'

group :development, :test do
  gem 'decidim-dev', DECIDIM_VERSION
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'factory_girl_rails'
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
