# == Schema Information
#
# Table name: recipients
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  first_name  :string(255)      not null
#  middle_name :string(255)
#  last_name   :string(255)
#  bioguide_id :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Recipient do
  pending "add some examples to (or delete) #{__FILE__}"
end
