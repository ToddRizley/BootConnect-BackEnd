class RemoveOrganizationIdFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :organization_id, :integer
  end
end
