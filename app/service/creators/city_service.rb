module Creators
  class CityService < BaseService
    def initialize(iata, city_data)
      @iata = iata
      @city_data = city_data
    end

    def execute
      create
    end

    private

    attr_reader :iata, :city_data

    def create
      City.create(
        name: city_data['name'],
        region: region,
        country: country,
        latitude: city_data['lat'],
        longitude: city_data['lon'],
        iata: iata
      )
    end

    def region
      Region.find_or_create_by(name: city_data['region'], country: country)
    end

    def country
      @country = Country.find_or_create_by(name: city_data['country'])
    end
  end
end