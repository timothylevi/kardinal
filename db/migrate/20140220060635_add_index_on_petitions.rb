class AddIndexOnPetitions < ActiveRecord::Migration
  def change
    # add_index :petitions, [:creator_id, :title], uniqueness: true
    # add_index :recipients, :bioguide_id, uniqueness: true
  end
end
