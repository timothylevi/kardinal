# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string(255)
#  body             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  #attr_accessible :user_id, :commentable_id, :commentable_type, :body

  belongs_to :commentable, polymorphic: true
  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

end
