class AddRegionToCity < ActiveRecord::Migration[7.0]
  def change
    add_reference :cities, :region, null: false, foreign_key: true
  end
end
