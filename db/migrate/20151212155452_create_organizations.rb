class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, limit: 100, null: false, default: ''
      t.integer :user_id
      t.integer :head_id
      t.text :description
      t.string :type

      t.string :facebook_page_url, limit: 250, null: false, default: ''
      t.string :website_url, limit: 250, null: false, default: ''
      t.string :phone, limit: 100, null: false, default: ''

      t.timestamps null: false
    end
  end
end
