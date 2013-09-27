class AddIndexToOrganizations < ActiveRecord::Migration
  def change
    add_index :organizations, :organization_code, :unique=>true
  end
end
