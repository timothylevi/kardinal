# == Schema Information
#
# Table name: victories
#
#  id           :integer          not null, primary key
#  petition_id  :integer          not null
#  text         :string(255)      not null
#  description  :string(255)      not null
#  victory_date :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Victory do
  pending "add some examples to (or delete) #{__FILE__}"
end
