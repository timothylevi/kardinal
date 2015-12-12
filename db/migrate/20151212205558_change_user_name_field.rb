class ChangeUserNameField < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, limit: 250, null: false, default: ''
  end
end
