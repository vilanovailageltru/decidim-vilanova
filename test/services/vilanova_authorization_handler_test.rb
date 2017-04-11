# frozen_string_literal: true

class VilanovaAuthorizationHandlerTest < Minitest::Test

  def setup
    @handle = VilanovaAuthorizationHandler.new(birthday: '22/02/1978',
                                               document_number: '46464646X')
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
