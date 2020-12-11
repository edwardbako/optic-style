class SmsSender
  class Error < StandardError; end

  Faraday::Response.register_middleware json_parse: JsonParser
  Faraday::Request.register_middleware timer: RequestTimer
  Faraday::Response.register_middleware errors: SmsErrors

  API_ID = Rails.application.credentials.dig(:sms_ru, :api_id)
  BASE_URL = "https://sms.ru/"

  def self.balance
    client.get(URI.join(BASE_URL, "my/balance"), default_params).body
  end

  def self.limit
    client.get(URI.join(BASE_URL, "my/limit"), default_params).body
  end

  def self.free
    client.get(URI.join(BASE_URL, "my/free"), default_params).body
  end

  def self.senders
    client.get(URI.join(BASE_URL, "my/senders"), default_params).body["senders"]
  end

  def self.send(params = {})
    params.merge!(default_params).merge!({
        from: senders.first,
        test: 1
                                         })
    client.post(URI.join(BASE_URL, "sms/send"), params).body
  end

  def self.status(ids = [])
    client.get(URI.join(BASE_URL, "sms/status"), default_params.merge({sms_id: ids.join(',')})).body
  end

  def self.add_callback(url)
    client.post(URI.join(BASE_URL, "callback/add"), default_params.merge(url: url)).body
  end

  def self.default_params
    {
        api_id: API_ID,
        json: 1
    }
  end

  def self.client
    Faraday.new do |faraday|
      faraday.request :timer
      faraday.request :url_encoded
      faraday.response :logger, Rails.logger
      faraday.response :errors
      faraday.response :json_parse
      faraday.adapter Faraday.default_adapter
    end
  end

end