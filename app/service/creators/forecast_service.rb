module Creators
  # Creates a Forecast object from string containing a valid IATA city code.
  class ForecastService < BaseService
    def initialize(iata, user)
      @iata = iata
      @user = user
    end

    def execute
      create_forecast_object
    end

    private

    attr_reader :iata, :user

    def create_forecast_object
      if city.present?
        forecast = Forecast.create(
          fahrenheit_temp: weather_data['temp_f'],
          celsius_temp: weather_data['temp_c'],
          city: city,
          user: user
        )
        forecast
      end
    end

    def find_or_create_city
      city = City.find_by(iata: iata)

      unless city.present?
        city = Creators::CityService.call(iata, city_data)
      end

      city
    end

    def city
      @city ||= find_or_create_city
    end

    def city_data
      weather_api_data['location']
    end

    def weather_data
      weather_api_data['current']
    end

    def weather_api_data
      @weather_api_data ||= WeatherApiService.call(iata)
    end
  end
end