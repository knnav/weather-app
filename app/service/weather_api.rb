class WeatherApi
  # todo: move these to application.yml
  BASE_URL = 'https://api.weatherapi.com/v1/'
  CURRENT_WEATHER_ENDPOINT = 'current.json'
  API_KEY = '4c60ce722db54419b1c13118230303'

  def initialize(iata)
    @iata = iata
  end

  def self.call(iata)
    self.new(iata).fetch
  end

  def fetch
  end

  private

  attr_reader :iata

  def endpoint
    "#{BASE_URL}#{CURRENT_WEATHER_ENDPOINT}?#{request_params}"
  end

  def request_params
    "?q=#{iata}&key=#{API_KEY}"
  end
end