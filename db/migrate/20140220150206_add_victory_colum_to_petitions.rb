class AddVictoryColumToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :victory, :boolean
    add_index :petitions, :victory
  end
end
