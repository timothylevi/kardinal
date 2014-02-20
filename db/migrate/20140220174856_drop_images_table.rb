class DropImagesTable < ActiveRecord::Migration
  def up
    drop_table :images
  end

  def down
    create_table :images do |t|
      t.integer  :imageable_id,       :null => false
      t.string   :imageable_type,     :null => false
      t.datetime :created_at,         :null => false
      t.datetime :updated_at,         :null => false
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
    end
  end
end
