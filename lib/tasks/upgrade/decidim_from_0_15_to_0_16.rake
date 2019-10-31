# frozen_string_literal: true

namespace :upgrade do
  desc 'Runs required tasks from decidim 0.16.x upgrade notes'
  # https://github.com/decidim/decidim/blob/0.16-stable/CHANGELOG.md
  task decidim_from_0_15_to_0_16: :environment do
    puts " \n == 0.16.0 required tasks =="

    puts ' -- migrate_data_to_decidim_forms'
    Rake::Task['decidim_surveys:migrate_data_to_decidim_forms'].invoke

    puts ' -- Populate help content to existing organizations'
    Decidim::Organization.find_each do |organization|
      Decidim::System::PopulateHelp.call(organization)
    end

    puts " \n == 0.16.1 required tasks =="

    puts ' -- User follow counters'
    Decidim::UserBaseEntity.find_each do |entity|
      follower_count = Decidim::Follow.where(followable: entity).count
      following_count = Decidim::Follow.where(decidim_user_id: entity.id).count
      entity.update_columns(
        followers_count: follower_count,
        following_count: following_count
      )
    end

    puts "\n\n **** Finished ****"
  end
end
