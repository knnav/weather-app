class ForecastsController < ApplicationController
  def new
  end

  def create
    puts "#{params}"
  end
end