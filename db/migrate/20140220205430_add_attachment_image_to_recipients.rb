class AddAttachmentImageToRecipients < ActiveRecord::Migration
  def self.up
    change_table :recipients do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :recipients, :image
  end
end
