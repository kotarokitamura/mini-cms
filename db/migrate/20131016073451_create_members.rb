class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :organization
      t.references :user

      t.timestamps
    end
    add_index :members, :organization_id
    add_index :members, :user_id
  end
end
