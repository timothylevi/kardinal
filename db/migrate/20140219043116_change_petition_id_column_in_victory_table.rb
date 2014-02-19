class ChangePetitionIdColumnInVictoryTable < ActiveRecord::Migration
  def change
    remove_index :victories, name: 'index_victories_on_petition_id'
    add_index :victories, :petition_id, unique: true
  end
end
