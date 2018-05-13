# frozen_string_literal: true

module Utils
  module RequestUtils
    def self.ping_site(site_address)
      http = Net::HTTP.new(URI(site_address).host, 80)
      http.request_get('/')
    end

    def self.request_domain(request)
      domain = request.scheme + '://' + request.host
      domain += ':' + request.port.to_s if request.port
      domain
    end
  end
end
