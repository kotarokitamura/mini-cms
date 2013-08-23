class CreateOrganizationInfos < ActiveRecord::Migration
  def change
    create_table :organization_infos do |t|
      t.integer :organization_id
      t.string :phone
      t.integer :product_information_flag,:default => 0
      t.integer :store_information_flag,:default => 0

      t.timestamps
    end
  end
end
