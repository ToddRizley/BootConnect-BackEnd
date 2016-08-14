class ChangeNameToStreetOnLocations < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :name, :street
  end
end
