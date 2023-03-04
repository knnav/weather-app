class AddCityToForecast < ActiveRecord::Migration[7.0]
  def change
    add_reference :forecasts, :city, null: false, foreign_key: true
  end
end
