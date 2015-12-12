class AddCategoryIdToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :category_id, :integer
  end
end
