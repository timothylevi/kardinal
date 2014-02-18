# == Schema Information
#
# Table name: petitions
#
#  id         :integer          not null, primary key
#  creator_id :integer          not null
#  title      :string(255)      not null
#  body       :text             not null
#  background :text             not null
#  approved   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Petition do
  pending "add some examples to (or delete) #{__FILE__}"
end
