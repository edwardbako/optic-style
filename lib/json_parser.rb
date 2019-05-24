class JsonParser

  def initialize(app)
    @app = app
  end

  def call(request_env)
    request_env.request_headers['Accept'] = 'application/json'
    @app.call(request_env).on_complete do |response_env|
      start = Time.now

      response_env.body = parse response_env.body

      Rails.logger.info "JSON Parser: Parsing finished in #{((Time.now - start) * 1000).to_i}ms"
    end
  end

  private

  def parse(body)
    JSON.parse body
  rescue
    body
  end
end
