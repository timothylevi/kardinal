class AddWebsiteColumnToContactDetail < ActiveRecord::Migration
  def change
    add_column :contact_details, :website, :string
  end
end
