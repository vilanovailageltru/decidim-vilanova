require 'test_helper'

class HttpBasicAuthenticationTest < ActionDispatch::IntegrationTest

  test 'blocks the request if no credentials' do
    create_password_protected_organization
    setup_http_basic_authentication_secrets

    get '/'

    assert_response(:unauthorized)
  end

  test 'blocks the request with incorrect credentials' do
    create_password_protected_organization
    setup_http_basic_authentication_secrets('user', 'pass')
    credentials =
      ActionController::HttpAuthentication::Basic.encode_credentials('user',
                                                                     'shall_not_pass')

    get '/', headers: { HTTP_AUTHORIZATION: credentials }

    assert_response(:unauthorized)
  end

  test 'allows access with correct credentials' do
    create_password_protected_organization
    setup_http_basic_authentication_secrets('user', 'pass')
    credentials =
      ActionController::HttpAuthentication::Basic.encode_credentials('user', 'pass')

    get '/', headers: { HTTP_AUTHORIZATION: credentials }

    assert_response(:success)
  end

  private

  def create_password_protected_organization
    FactoryBot.create(:organization, http_basic_authentication_protected: true,
                          host: 'www.example.com')
  end

  def setup_http_basic_authentication_secrets(name = 'vegeta', password = 'over_9000')
    Rails.application.secrets.http_basic_authentication['name'] = name
    Rails.application.secrets.http_basic_authentication['password'] = password
  end

end
