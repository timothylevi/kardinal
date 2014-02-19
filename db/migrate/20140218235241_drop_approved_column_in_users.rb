class DropApprovedColumnInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :authorized
    remove_column :users, :auth_token
    add_column :users, :activated, :string, default: false
    add_column :users, :activation_token, :string
  end
end
