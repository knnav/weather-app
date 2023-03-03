class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.float :fahrenheit_temp
      t.float :celsius_temp

      t.timestamps
    end
  end
end
