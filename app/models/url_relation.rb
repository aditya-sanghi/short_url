class UrlRelation < ApplicationRecord
  validates :short_version, presence: true, uniqueness: true, url: true
  validates :full_version, url: { no_local: true }, uniqueness: true

  before_validation :get_short_version, on: :create
  before_create :add_trailing_slash

  attr_accessor :domain_url

  private

  def add_trailing_slash
    full_uri = URI(full_version)
    if full_uri.host + full_uri.path == full_version && full_version[-1] != '/'
      self.full_version += '/'
    end
  end

  def get_short_version
    return if full_version.blank? || domain_url.blank?

    self.short_version ||= generate_short_url
  end

  def generate_short_url
    domain_url + 'urls/' + generate_short_version_hash
  end

  def generate_short_version_hash
    Digest::MD5.hexdigest(full_version)
  end

end
