class ChangeColumnOnPetitions < ActiveRecord::Migration
  def change
    remove_column :petitions, :is_victory
    add_column :petitions, :is_victory, :boolean, default: false
  end
end
