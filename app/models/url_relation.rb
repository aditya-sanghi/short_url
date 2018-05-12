class UrlRelation < ApplicationRecord
  validates :short_version, presence: true
  validates :full_version, url: { no_local: true }

  before_validation :generate_short_version

  private

  def generate_short_version
    return if short_version.present? || full_version.blank?

    self.short_version = Digest::MD5.hexdigest(full_version)
  end
end
