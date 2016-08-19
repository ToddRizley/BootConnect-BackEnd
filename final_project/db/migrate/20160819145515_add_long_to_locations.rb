class AddLongToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :longitude, :decimal, :precision => 15, :scale => 10
  end
end
