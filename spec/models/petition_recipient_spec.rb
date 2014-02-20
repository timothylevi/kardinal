# == Schema Information
#
# Table name: petition_recipients
#
#  id           :integer          not null, primary key
#  petition_id  :integer          not null
#  recipient_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe PetitionRecipient do
  pending "add some examples to (or delete) #{__FILE__}"
end
