# frozen_string_literal: true
Decidim.configure do |config|
  config.application_name = 'Participa Vilanova'
  config.mailer_sender    = 'participacio@vilanova.cat'

  # Reset default workflows
  Decidim::Verifications.clear_workflows

  Decidim::Verifications.register_workflow(:vilanova_authorization_handler) do |auth|
    auth.form = 'VilanovaAuthorizationHandler'
  end

  config.available_locales = [:ca, :es]
  config.default_locale = :ca

  # Geocoder configuration
  geocoder_config = Rails.application.secrets.geocoder
  if geocoder_config['here_app_id'].present? && geocoder_config['here_app_code'].present?
    config.geocoder = {
      here_app_id: geocoder_config['here_app_id'],
      here_app_code: geocoder_config['here_app_code']
    }
  end

  # Currency unit
  config.currency_unit = "€"
end
