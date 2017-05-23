# frozen_string_literal: true

class VilanovaAuthorizationHandlerTest < Minitest::Test

  include ActiveSupport::Testing::TimeHelpers

  def setup
    @handle = VilanovaAuthorizationHandler.new(birthday: '22/02/1978',
                                               document_number: '46464646X')
    travel_to Date.new(2017, 1, 1)
  end

  def teardown
    travel_back
  end

  def test_valid
    @handle.stub :cense_for_user, 123 do
      assert_equal true, @handle.valid?
      assert_equal 123, @handle.unique_id
    end
  end

  def test_invalid_empty_birthday
    @handle.birthday = ''
    @handle.stub :cense_for_user, 123 do
      assert_equal false, @handle.valid?
    end
  end

  def test_user_older_than_16_years
    @handle.birthday = '01/01/2002'
    @handle.stub :cense_for_user, 123 do
      assert_equal false, @handle.valid?
    end
    @handle.birthday = '01/01/2001'
    @handle.stub :cense_for_user, 123 do
      assert_equal true, @handle.valid?
    end
  end

  def test_invalid_birthday_not_allowed
    @handle.birthday = '55/14/2017'
    @handle.stub :cense_for_user, 123 do
      assert_equal false, @handle.valid?
    end
  end

  def test_invalid_empty_document_number
    @handle.document_number = ''
    @handle.stub :cense_for_user, 123 do
      assert_equal false, @handle.valid?
    end
  end

  def test_invalid_no_censed
    @handle.stub :cense_for_user, nil do
      assert_equal false, @handle.valid?
      assert_nil @handle.unique_id
    end
  end

end
