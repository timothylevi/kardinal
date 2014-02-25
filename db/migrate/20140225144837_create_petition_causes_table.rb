class CreatePetitionCausesTable < ActiveRecord::Migration
  def change
    create_table :petition_causes do |t|
      t.integer :petition_id, null: false
      t.integer :cause_id, null: false

      t.timestamps
    end

    add_index :petition_causes, [:petition_id, :cause_id], unique: true
  end
end
