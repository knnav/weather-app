class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :iata

      t.timestamps
    end
  end
end
