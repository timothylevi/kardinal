# == Schema Information
#
# Table name: petition_signatures
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  petition_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PetitionSignatures < ActiveRecord::Base
  # attr_accessible :title, :body
end
