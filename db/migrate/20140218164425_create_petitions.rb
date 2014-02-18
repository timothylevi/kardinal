class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :creator_id
      t.string :title
      t.text :body
      t.text :background
      t.boolean :approved

      t.timestamps
    end

    add_index :petitions, :creator_id
  end
end
