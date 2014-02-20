class AddVictoryColumToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :is_victory, :boolean
    add_index :petitions, :is_victory
  end
end
