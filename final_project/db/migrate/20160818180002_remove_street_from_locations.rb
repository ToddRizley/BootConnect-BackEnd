class RemoveStreetFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :street, :string
  end
end
