class AddRatingToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :rating, :integer, null: false, default: 0
  end
end
