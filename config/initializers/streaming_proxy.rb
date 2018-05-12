require 'rack/streaming_proxy'

Rails.application.configure do
  config.streaming_proxy.logger             = Rails.logger                          # stdout by default
  config.streaming_proxy.num_retries_on_5xx = 5                                     # 0 by default
  config.streaming_proxy.raise_on_5xx       = true                                  # false by default

  # Will be inserted at the end of the middleware stack by default.
  config.middleware.use Rack::StreamingProxy::Proxy do |request|
    # Inside the request block, return the full URI to redirect the request to,
    # or nil/false if the request should continue on down the middleware stack.
    if request.path.match(/\/urls\/(.+)/)
      url_relation = UrlRelation.find_by!(short_version: request.url)
      begin
        url_relation.full_version
      rescue => ex
        Rails.logger.error ex.message
      end
    end
  end
end
