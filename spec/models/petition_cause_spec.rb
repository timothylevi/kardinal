# == Schema Information
#
# Table name: petition_causes
#
#  id          :integer          not null, primary key
#  petition_id :integer          not null
#  cause_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe PetitionCause do
  pending "add some examples to (or delete) #{__FILE__}"
end
