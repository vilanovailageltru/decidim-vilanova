# frozen_string_literal: true

class VilanovaAuthorizationHandler < Decidim::AuthorizationHandler

  attribute :document_number, String
  attribute :birthday, String

  validates :document_number, :birthday, presence: true
  validate :older_than_16_years
  validate :censed_and_add_metadata

  def censed_and_add_metadata
    return if cense_for_user
    errors.add(:document_number, I18n.t('errors.messages.not_censed'))
  end

  def authorized?
    return true if cense_for_user
  end

  def unique_id
    cense_for_user
  end

  private

  def older_than_16_years
    parsed_birthday = Date.strptime(birthday, '%d/%m/%Y')
    return if parsed_birthday <= 16.years.ago
    errors.add(:birthday, I18n.t('errors.messages.younger_than_16'))
  rescue ArgumentError
    errors.add(:birthday, I18n.t('errors.messages.invalid_date'))
  end

  def cense_for_user
    @cense_for_user ||= CenseApi.search_user_vilanova_id(self)
    @cense_for_user
  end

end
