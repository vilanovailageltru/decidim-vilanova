require 'test_helper'

class CenseApiTest < Minitest::Test

  def setup
    @birthday = '22/02/1978'
    @document_number = '46464646X'
    @url = "http://aj_ws.ajuntament.org/comprovaempadronament/default.aspx?data=#{@birthday}&nif=#{@document_number}"
    @ok_user_vilanova_id = 123
    @ok_boby = "{ \"exists\": true, \"id\": #{@ok_user_vilanova_id} }"
    @ko_body = '{ "exists": false, "id": "" }'

    @mock_handle = MiniTest::Mock.new
    @mock_handle.expect(:birthday, @birthday)
    @mock_handle.expect(:document_number, @document_number)
  end

  def test_return_ok
    stub_request(:get, @url)
      .to_return(status: 200,
                 body: @ok_boby)

    assert_equal @ok_user_vilanova_id, CenseApi.search_user_vilanova_id(@mock_handle)
  end

  def test_not_find_user
    stub_request(:get, @url)
      .to_return(body: @ko_body,
                 headers: {})

    assert_equal false, CenseApi.search_user_vilanova_id(@mock_handle)
  end

end
