class AddAttachmentImageToPetitions < ActiveRecord::Migration
  def self.up
    change_table :petitions do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :petitions, :image
  end
end
