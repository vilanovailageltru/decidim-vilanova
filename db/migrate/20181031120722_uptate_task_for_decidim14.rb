# frozen_string_literal: true

# Required when update Decidim to v0.13.0
# https://github.com/decidim/decidim/blob/v0.14.4/CHANGELOG.md#0130
class UptateTaskForDecidim14 < ActiveRecord::Migration[5.2]
  def change
    Decidim::User.find_each(&:add_to_index_as_search_resource)
    Decidim::Gamification.reset_badges
  end
end
