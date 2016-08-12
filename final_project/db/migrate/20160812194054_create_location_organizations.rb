class CreateLocationOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :location_organizations do |t|
      t.integer :location_id
      t.integer :organization_id
    end
  end
end
