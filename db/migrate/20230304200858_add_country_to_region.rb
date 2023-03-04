class AddCountryToRegion < ActiveRecord::Migration[7.0]
  def change
    add_reference :regions, :country, null: false, foreign_key: true
  end
end
