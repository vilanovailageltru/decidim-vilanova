# frozen_string_literal: true

Rails.application.config.i18n.available_locales = %i[ca es en]
Rails.application.config.i18n.enforce_available_locales = false
Rails.application.config.i18n.fallbacks = { es: [:en], ca: [:en] }
I18n.available_locales = %i[ca es en]
