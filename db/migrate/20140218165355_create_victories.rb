class CreateVictories < ActiveRecord::Migration
  def change
    create_table :victories do |t|
      t.integer :petition_id, null: false
      t.string :text, null: false
      t.string :description, null: false
      t.date :victory_date, null: false

      t.timestamps
    end

    add_index :victories, :petition_id
  end
end
