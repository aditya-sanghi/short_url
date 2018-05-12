class UrlRelation < ApplicationRecord
  validates :short_version, presence: true
  validates :full_version, url: { no_local: true }

  before_validation :get_short_version, on: :create

  private

  def get_short_version
    return if full_version.blank?

    self.short_version ||= generate_short_version_hash
  end

  def generate_short_version_hash
    Digest::MD5.hexdigest(full_version)
  end

end
