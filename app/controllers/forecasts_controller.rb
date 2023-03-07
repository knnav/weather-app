class ForecastsController < ApplicationController
  def new
  end

  def create
    if params['iata'].present?
      formatted_iata = params['iata'].upcase
      Rails.cache.fetch("forecast_for_#{formatted_iata}", expires_in: 30.minutes) do
        @forecast = Creators::ForecastService.call(formatted_iata, current_user)

        if @forecast.present?
          redirect_to "/forecast/#{@forecast.id}"
        end
      end
    end
  rescue StandardError
    redirect_to '/err_404' and return
  end

  def show
    @forecast = Forecast.find(params[:id])

    if user_signed_in?
      @past_forecasts = current_user.forecasts.last(11).first(10)
    end
  end
end