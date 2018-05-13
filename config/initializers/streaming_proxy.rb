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
    if (url_code = request.path.match("\/urls\/(.+)").try(:[], 1))
      begin
        url_id = Utils::UrlUtils.decode(url_code)
        url_relation = UrlRelation.find(url_id)
        url_relation.add_request_info!(request)
        Utils::RequestUtils.ping_site(url_relation.full_version)

        url_relation.full_version
      rescue StandardError => ex
        Rails.logger.error ex.message
        # Render 404 if site can not be reached
        Utils::RequestUtils.request_domain(request) + '/404'
      end
    end
  end
end
