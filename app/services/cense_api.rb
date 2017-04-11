require 'httparty'

class CenseApi

  def self.search_user_vilanova_id(handle)
    response = HTTParty.get(Rails.application.secrets.censed_api_endpoint,
                             query: { nif: handle.document_number,
                                      data: handle.birthday },
                             format: :plain)
    parsed_response = parse_response(response.parsed_response)

    return if parsed_response[:id].blank? || parsed_response[:exists] == 'false'

    parsed_response[:id]
  end

  private

  def self.parse_response(response)
    if response.match(/{exists:(true|false),id:(.*)}/)
      {
        exists: $1,
        id: $2
      }
    else
      fail 'Unrecognised Cense API response format'
    end
  end

end
