# frozen_string_literal: true

class VilanovaAuthorizationHandler < Decidim::AuthorizationHandler

  attribute :document_number, String
  attribute :birthday, String

  validates :document_number, :birthday, presence: true
  validate :censed_and_add_metadata

  def censed_and_add_metadata
    errors.add(:document_number, I18n.t('errors.messages.not_censed')) unless cense
    false
  end

  def authorized?
    return true if cense
  end

  def unique_id
    cense || nil
  end

  private

  def cense
    @cense ||= CenseApi.search_user_vilanova_id(self)
    @cense
  end

end
