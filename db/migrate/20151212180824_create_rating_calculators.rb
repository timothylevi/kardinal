class CreateRatingCalculators < ActiveRecord::Migration
  def change
    create_table :rating_calculators do |t|
      t.integer :facebook_connected, null: false, default: 0
      t.integer :profile_filled_in, null: false, default: 0
      t.integer :petition_signed, null: false, default: 0
      t.integer :petition_added, null: false, default: 0
      t.integer :comment_upvoted, null: false, default: 0
      t.timestamps null: false
    end
  end
end
