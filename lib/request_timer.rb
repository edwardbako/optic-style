class RequestTimer

  def initialize(app)
    @app = app
  end

  def call(request_env)
    start = Time.now
    @app.call(request_env).on_complete do |reqponse_env|
      Rails.logger.info "Timer: Request completed in #{((Time.now - start) * 1000).to_i}ms"
    end
  end
end