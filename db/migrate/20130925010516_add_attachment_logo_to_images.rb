class AddAttachmentLogoToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :images, :logo
  end
end
