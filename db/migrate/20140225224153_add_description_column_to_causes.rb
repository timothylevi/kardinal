class AddDescriptionColumnToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :description, :string
  end
end
