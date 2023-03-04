class WeatherApiService < BaseService
  def initialize(iata)
    @iata = iata
  end

  def execute
    response.body
  rescue StandardError
    # To-do: manage this better
    puts "An error occured while fetching data from weatherapi.com"
  end

  private

  attr_reader :iata

  def response
    @response ||= Faraday.get(endpoint)
  end

  def endpoint
    "#{base_url}#{current_weather_endpoint}?#{request_params}"
  end

  def request_params
    "q=#{iata}&key=#{api_key}"
  end

  def base_url
    Settings.weather_api.base_url
  end

  def current_weather_endpoint
    Settings.weather_api.current_weather_endpoint
  end

  def api_key
    Settings.weather_api.key
  end
end