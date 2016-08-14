class AddEmailAddressToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :email_address, :string
  end
end
