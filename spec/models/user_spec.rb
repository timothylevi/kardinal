require 'spec_helper'

describe User do
  it "validates presence of e-mail" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it "validates presence of name" do
    expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end

  it "validates presence of password digest" do
    expect(FactoryGirl.build(:user, pw_digest: nil)).not_to be_valid
  end

  it "splits name into first and last"
  it "validates presence of zip"
end
