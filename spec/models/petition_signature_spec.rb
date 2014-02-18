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

require 'spec_helper'

describe PetitionSignature do
  pending "add some examples to (or delete) #{__FILE__}"
end
