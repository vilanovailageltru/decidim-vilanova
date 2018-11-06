# frozen_string_literal: true

# Required when update Decidim to v0.13.0
# https://github.com/decidim/decidim/blob/v0.13.0/CHANGELOG.md#0130
class UptateTaskForDecidim13 < ActiveRecord::Migration[5.2]
  def change
    Decidim::User.find_each do |user|
      user.avatar.recreate_versions! if user.avatar?
    end
  end
end
