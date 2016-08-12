class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.integer :organization_id
    end
  end
end
