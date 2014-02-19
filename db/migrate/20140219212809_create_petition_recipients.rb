class CreatePetitionRecipients < ActiveRecord::Migration
  def change
    create_table :petition_recipients do |t|
      t.integer :petition_id, null: false
      t.integer :recipient_id, null: false

      t.timestamps
    end

    add_index :petition_recipients, [:petition_id, :recipient_id], unique: true
  end
end
