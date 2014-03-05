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
  it "::find_single finds PetitionRecipient by recipient_id and petition_id" do
    pr = PetitionRecipient.create(
      petition_id: 10,
      recipient_id: 20
    )

    expect(PetitionRecipient.find_single(20, 10)).not_to be_nil
  end
end
