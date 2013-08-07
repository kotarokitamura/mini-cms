class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :organization_id
      t.string :store_name

      t.timestamps
    end
  end
end
