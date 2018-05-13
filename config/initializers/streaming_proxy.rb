# frozen_string_literal: true

require 'rack/streaming_proxy'

Rails.application.configure do
  config.streaming_proxy.logger             = Rails.logger
  config.streaming_proxy.num_retries_on_5xx = 5
  config.streaming_proxy.raise_on_5xx       = true

  # Will be inserted at the end of the middleware stack by default.
  config.middleware.use Rack::StreamingProxy::Proxy do |request|
    # Inside the request block, return the full URI to redirect the request to,
    # or nil/false if the request should continue on down the middleware stack.
    if request.path.match?("\/urls\/(.+)")
      begin
        url_relation = UrlRelation.find_by!(short_version: request.url)
        url_relation.add_request_info!(request)

        url_relation.full_version
      rescue StandardError => ex
        Rails.logger.error ex.message
      end
    end
  end
end
