class ChangePetitionIdColumnInVictoryTable < ActiveRecord::Migration
  def change
    add_index :victories, :petition_id, unique: true
  end
end
