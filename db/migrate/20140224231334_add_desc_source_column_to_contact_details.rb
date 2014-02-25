class AddDescSourceColumnToContactDetails < ActiveRecord::Migration
  def change
    add_column :contact_details, :desc_source, :string
  end
end
