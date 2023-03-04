class WeatherApiService
  # todo: move these to application.yml
  BASE_URL = 'https://api.weatherapi.com/v1/'
  CURRENT_WEATHER_ENDPOINT = 'current.json'
  API_KEY = 'aeee604dddcf463ebc734222230403'

  def initialize(iata)
    @iata = iata
  end

  def self.call(iata)
    self.new(iata).fetch
  end

  def fetch
    a=Faraday.get(endpoint)
    a.body
  end

  private

  attr_reader :iata

  def endpoint
    "#{BASE_URL}#{CURRENT_WEATHER_ENDPOINT}?#{request_params}"
  end

  def request_params
    "q=#{iata}&key=#{API_KEY}"
  end
end