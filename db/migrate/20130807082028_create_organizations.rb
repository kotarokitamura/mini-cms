class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organization_name
      t.string :organization_code,:null => false,:unique => true

      t.timestamps
    end
  end
end
