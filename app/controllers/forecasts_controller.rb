class ForecastsController < ApplicationController
  def new
  end

  def create
    if params['iata'].present?
      @forecast = Creators::ForecastService.call(params['iata'], current_user)

      if @forecast.present?
        redirect_to "/forecast/#{@forecast.id}"
      end
    end
  end

  def show
    @forecast = Forecast.find(params[:id])

    if user_signed_in?
      @past_forecasts = current_user.forecasts.last(11).first(10)
    end
  end
end