class AddColumnsToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :gov_state, :string
    add_column :recipients, :office, :string
    add_column :recipients, :party, :string
  end
end
