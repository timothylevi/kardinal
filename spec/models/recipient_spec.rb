# == Schema Information
#
# Table name: recipients
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  first_name         :string(255)      not null
#  middle_name        :string(255)
#  last_name          :string(255)
#  bioguide_id        :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  gov_state          :string(255)
#  office             :string(255)
#  party              :string(255)
#  email              :string(255)
#  creator_id         :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'spec_helper'

describe Recipient do
  it "::list_titles lists possible titles for recipient" do
    titles = ["Mr", "Ms", "Mx", "Sen", "Rep", "Del", "Com"]

    expect(Recipient.list_titles).to eq(titles)
  end

  it "::set_descriptions sets description for all recipients" do
    recipient = FactoryGirl.build(:recipient)
    recipient.creator_id = 1
    recipient.save!
    recipient.contact_details.create!(zip: 10000)

    Recipient.set_descriptions

    expect(recipient.contact_details.first.description).not_to be_nil
  end

  it "::set_images sets images for all recipients"

  it "#list_name returns a formatted name for recipient" do
    recipient = FactoryGirl.build(:recipient)
    expect(recipient.list_name).to eq("MA Sen. Elizabeth Warren")
  end
end
