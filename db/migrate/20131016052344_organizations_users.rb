class OrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users, :id => false do |t|
      t.references :organization
      t.references :user
    end
    add_index :organizations_users, :organization_id
    add_index :organizations_users, :user_id
  end
end
