require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  if Rails.application.config.action_mailer.delivery_method == :letter_opener_web
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  authenticate :admin do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount Decidim::Core::Engine => '/'
  mount Decidim::FileAuthorizationHandler::AdminEngine => '/admin'
end
