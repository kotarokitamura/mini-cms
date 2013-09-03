class CreateViewDesigns < ActiveRecord::Migration
  def change
    create_table :view_designs do |t|
      t.integer :organization_id
      t.integer :design_number,:default => 0

      t.timestamps
    end
  end
end
