# frozen_string_literal: true

include Decidim::TranslatableAttributes

namespace :decidim_vilanova do

  desc "Export emails of users which created a proposal by participatory process"
  task export_proposals_users: :environment do
    processes = Decidim::ParticipatoryProcess.all

    processes.each do |process|
      path = "tmp/process_#{process.slug}.csv"
      puts "=== Exporting data of process #{translated_attribute(process.title)} with slug #{process.slug} to #{path}..."

      CSV.open(path, "wb") do |csv|
        components = process.components.where(manifest_name: "proposals")
        proposals = Decidim::Proposals::Proposal.where(component: components)
        emails = proposals.map(&:authors).flatten.uniq.map { |author| author.try(:email) }.compact
        csv << ['email']
        emails.each { |email| csv << [email] }
      end
    end
  end
end
