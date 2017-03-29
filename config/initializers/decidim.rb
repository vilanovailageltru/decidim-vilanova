# -*- coding: utf-8 -*-
# frozen_string_literal: true
Decidim.configure do |config|
  config.application_name = 'Participa Vilanova'
  config.mailer_sender    = 'participacio@vilanova.cat'
  config.authorization_handlers = [ExampleAuthorizationHandler]

  # Uncomment this lines to set your preferred locales
  # config.available_locales = %i{en ca es}

  # Geocoder configuration
  # config.geocoder = {
  #   here_app_id: Rails.application.secrets.geocoder["here_app_id"],
  #   here_app_code: Rails.application.secrets.geocoder["here_app_code"]
  # }

  # Currency unit
  # config.currency_unit = "€"
end
