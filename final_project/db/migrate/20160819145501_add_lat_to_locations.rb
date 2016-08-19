class AddLatToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :latitude, :decimal, :precision => 15, :scale => 10
  end
end
