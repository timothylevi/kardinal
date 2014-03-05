# == Schema Information
#
# Table name: petitions
#
#  id                 :integer          not null, primary key
#  creator_id         :integer          not null
#  title              :string(255)      not null
#  body               :text             not null
#  background         :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  approved           :string(255)      default("Pending")
#  goal               :integer
#  is_victory         :boolean          default(FALSE)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'spec_helper'

describe Petition do
  it "#ensure_goal sets petition.goal to 100 if not specified" do
    user = FactoryGirl.create(:user)
    petition = user.petitions.create(
      title: "petition title",
      body: "petition letter body",
      background: "petition background")

    expect(petition.goal).to be(100)
  end

  it "#ensure_goal does not alter petition.goal when specified" do
    user = FactoryGirl.create(:user)
    petition = user.petitions.create(
      title: "petition title",
      body: "petition letter body",
      background: "petition background",
      goal: 200)

    expect(petition.goal).not_to be(100)
    expect(petition.goal).to be(200)
  end
end
