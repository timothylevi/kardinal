class AddCreatorIdColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :creator_id, :integer
    add_index :recipients, :creator_id
  end
end
