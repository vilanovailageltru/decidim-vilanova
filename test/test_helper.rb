ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'decidim/faker/localized'
require 'webmock/minitest'
require "factory_bot"
require 'minitest/mock'

require "decidim/core/test/factories"

module ActiveSupport
  class TestCase

    include FactoryBot::Syntax::Methods

  end
end
