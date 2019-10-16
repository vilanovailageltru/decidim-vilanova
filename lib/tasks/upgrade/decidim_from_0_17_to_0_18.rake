# frozen_string_literal: true

namespace :upgrade do
  desc 'Runs required tasks from decidim 0.18.x upgrade notes'
  # https://github.com/decidim/decidim/blob/0.17-stable/CHANGELOG.md
  task decidim_from_0_17_to_0_18: :environment do
    puts " \n == 0.18.0 required tasks =="

    puts ' -- recalculate participants metrics'
    days = (Date.parse(2.months.ago.to_s)..Date.yesterday).map(&:to_s)
    Decidim::Organization.find_each do |organization|
      old_metrics = Decidim::Metric.where(organization: organization, metric_type: "participants")
      days.each do |day|
        new_metric = Decidim::Metrics::ParticipantsMetricManage.new(day, organization)
        ActiveRecord::Base.transaction do
          old_metrics.where(day: day).delete_all
          new_metric.save
        end
      end
    end

    puts "\n\n **** Finished ****"
  end
end
