class AddEmailColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :email, :string
  end
end
