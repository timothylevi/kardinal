class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :title, null: false
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name
      t.string :bioguide_id

      t.timestamps
    end
  end
end
