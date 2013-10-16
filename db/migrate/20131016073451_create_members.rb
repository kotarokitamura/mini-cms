class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :organization_id
      t.references :user_id

      t.timestamps
    end
    add_index :members, :organization_id_id
    add_index :members, :user_id_id
  end
end
