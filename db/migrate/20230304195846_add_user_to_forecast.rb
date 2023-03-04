class AddUserToForecast < ActiveRecord::Migration[7.0]
  def change
    add_reference :forecasts, :user, foreign_key: true
  end
end
