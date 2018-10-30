class UpdateDecidim12Actions < ActiveRecord::Migration[5.2]
  def change
    Decidim::Meetings::Meeting.find_each(&:add_to_index_as_search_resource)
    Decidim::Proposals::Proposal.find_each(&:add_to_index_as_search_resource)
    Decidim::Organization.find_each { |organization| Decidim::System::CreateDefaultPages.call(organization) }
  end
end
