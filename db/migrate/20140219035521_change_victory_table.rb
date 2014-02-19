class ChangeVictoryTable < ActiveRecord::Migration
  def change
    remove_column :victories, :text
    remove_column :victories, :victory_date
    add_column :victories, :message, :text, null: false
  end
end
