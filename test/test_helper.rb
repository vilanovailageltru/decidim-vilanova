ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'decidim/faker/localized'

class ActiveSupport::TestCase

  include FactoryGirl::Syntax::Methods

end
