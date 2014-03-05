# == Schema Information
#
# Table name: contact_details
#
#  id               :integer          not null, primary key
#  street_address   :string(255)
#  city             :string(255)
#  state            :string(255)
#  zip              :string(255)      not null
#  country          :string(255)
#  phone            :string(255)
#  birthday         :datetime
#  description      :text
#  contactable_id   :integer          not null
#  contactable_type :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  website          :string(255)
#  twitter_id       :string(255)
#  facebook_id      :string(255)
#  contact_form     :string(255)
#  desc_source      :string(255)
#

require 'spec_helper'

describe ContactDetail do
  it "::list_states returns 60 potential states" do
    expect(ContactDetail.list_states.count).to eq(60)
  end

  it "#http_website appends \"http://\" to website when it doesn't exist" do
    cd = ContactDetail.create(
      zip: "12345",
      contactable_id: 1,
      contactable_type: "User",
      website: "example.com")

    expect(cd.http_website).to eq("http://example.com")
  end

  it "#http_website returns website when \"http://\" exists" do
    cd = ContactDetail.create(
      zip: "12345",
      contactable_id: 1,
      contactable_type: "User",
      website: "http://www.example.com")

    expect(cd.http_website).not_to eq("example.com")
    expect(cd.http_website).to eq("http://www.example.com")
  end
end
