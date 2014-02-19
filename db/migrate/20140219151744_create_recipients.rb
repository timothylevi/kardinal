class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :title, null: false
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
