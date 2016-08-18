class RemoveZipcodeFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :zipcode, :integer
  end
end
