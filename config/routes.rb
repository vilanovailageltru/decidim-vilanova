Rails.application.routes.draw do
  if Rails.application.config.action_mailer.delivery_method == :letter_opener_web
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  mount Decidim::Core::Engine => '/'

end
