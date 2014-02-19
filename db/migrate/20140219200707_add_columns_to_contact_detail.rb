class AddColumnsToContactDetail < ActiveRecord::Migration
  def change
    add_column :contact_details, :twitter_id, :string
    add_column :contact_details, :facebook_id, :string
    add_column :contact_details, :contact_form, :string
  end
end
