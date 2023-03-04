class ForecastsController < ApplicationController
  def new
  end

  def create
    if params['iata'].present?
      @forecast = Creators::ForecastService.call(params['iata'], current_user)

      if @forecast.present?
        redirect_to forecast_path(@forecast)
      end
    end
  end

  def show
    @forecast = Forecast.find(params[:id])
  end
end