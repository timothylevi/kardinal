class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :pw_digest, null: false
      t.string :name, null: false
      t.string :authorized, default: false
      t.string :pwreset_token, null: false
      t.string :auth_token, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
