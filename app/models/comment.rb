class Comment < ActiveRecord::Base
  attr_accessible :user_id, :commentable_id, :commentable_type, :body

  belongs_to :commentable, polymorphic: true
  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

end
