class SmsErrors

  def initialize(app)
    @app = app
  end

  def call(request_env)
    @app.call(request_env).on_complete do |response_env|
      if response_env.body["status"] == "ERROR"
        raise SmsSender::Error, "Status Code: #{response_env.body["status_code"]}. #{response_env.body["status_text"]}"
      end
      if response_env.status != 200
        raise SmsSender::Error, "Status Code: #{response_env.status}. #{response_env.reason_phrase}"
      end
    end
  end
end