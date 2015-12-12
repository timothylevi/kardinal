class AddOrganizationIdToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :organization_id, :integer
  end
end
