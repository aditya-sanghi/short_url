# frozen_string_literal: true

class UrlRelation < ApplicationRecord
  validates :full_version, url: { no_local: true }, uniqueness: true

  before_create :add_trailing_slash

  has_many :user_requests

  def add_request_info!(request)
    return if request.blank?

    browser = Browser.new(request.user_agent)
    user_requests.create!(platform_name: browser.platform.name,
                          platform_version: browser.platform.version,
                          browser_name: browser.name,
                          browser_version: browser.version,
                          ip: request.ip)
  end

  def shortened_url_code
    @shortened_url_code ||= Utils::UrlUtils.encode(id)
  end

  private

  def add_trailing_slash
    full_uri = URI(full_version)
    uri_wihtout_parameters = full_uri.scheme + '://' + full_uri.host + full_uri.path

    return unless uri_wihtout_parameters == full_version && full_version[-1] != '/'

    self.full_version += '/'
  end
end
