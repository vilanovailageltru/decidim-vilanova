# frozen_string_literal: true
Decidim.configure do |config|
  config.application_name = 'Participa Vilanova'
  config.mailer_sender    = 'participacio@vilanova.cat'

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

  # SSL disabled
  config.force_ssl = true

  # Enable HTML header snippets
  config.enable_html_header_snippets = true

  # Max requests in a time period to prevent DoS attacks. Only applied on production.
  config.throttling_max_requests = 500

  # Time window in which the throttling is applied.
  config.throttling_period = 1.minute

  # Unconfirmed access
  config.unconfirmed_access_for = 2.days

  # Defines the social networking services used for social sharing
  config.social_share_services = %w(X Facebook WhatsApp Telegram)
end

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale

# Inform Decidim about the assets folder
Decidim.register_assets_path File.expand_path("app/packs", Rails.application.root)
