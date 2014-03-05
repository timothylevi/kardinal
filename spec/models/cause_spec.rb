# == Schema Information
#
# Table name: causes
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

require 'spec_helper'

describe Cause do
  it "#to_param returns name attribute" do
    cause = Cause.create!(name: "example")

    expect(cause.to_param).to eq("example")
  end
end
