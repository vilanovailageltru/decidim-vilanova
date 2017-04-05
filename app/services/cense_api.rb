require 'httparty'

class CenseApi

  def self.search_user_vilanova_id(handle)
    response_parsed = JSON.parse(
      HTTParty.get('http://aj_ws.ajuntament.org/comprovaempadronament/default.aspx',
                   query: { nif: handle.document_number,
                            data: handle.birthday })
    )

    return if response_parsed['id'].blank? || response_parsed['exists'] == false

    response_parsed['id']
  end

end
