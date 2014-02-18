class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :creator_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :background, null: false
      t.boolean :approved, default: false

      t.timestamps
    end

    add_index :petitions, :creator_id
  end
end
