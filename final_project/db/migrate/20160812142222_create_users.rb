class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :position
      t.string :company
      t.string :bio
      t.string :email_address

      t.timestamps
    end
  end
end
