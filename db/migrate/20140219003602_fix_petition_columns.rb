class FixPetitionColumns < ActiveRecord::Migration
  def change
    remove_column :petitions, :approved
    add_column :petitions, :approved, :string, default: "Pending"
    add_column :petitions, :goal, :integer
  end
end
