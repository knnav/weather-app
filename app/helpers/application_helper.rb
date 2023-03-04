module ApplicationHelper
  def formatted_weather(forecast)
    "#{forecast.celsius_temp}°C / #{forecast.fahrenheit_temp}°F"
  end

  def city_display_name(city)
    "#{city.name}, #{city.country.name} (#{city.iata.upcase})"
  end
end
