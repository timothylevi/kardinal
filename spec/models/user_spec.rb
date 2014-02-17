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

  it "validates presence of password-reset token" do
    user = FactoryGirl.build(:user, pwreset_token: nil)
    expect(user).to be_valid
  end

  it "validates presence of authorization token" do
    user = FactoryGirl.build(:user, auth_token: nil)
    expect(user).to be_valid
  end

  it "validates presence of session token" do
    user = FactoryGirl.build(:user, session_token: nil)
    expect(user).to be_valid
  end

  it "splits name into first and last" do
    user = FactoryGirl.build(:user, name: "Timothy Campbell")
    expect(user.first_name).to eq("Timothy")
    expect(user.last_name).to eq("Campbell")
  end

  it "splits name into first, middle, and last" do
    user = FactoryGirl.build(:user, name: "Timothy Levi Campbell")
    expect(user.first_name).to eq("Timothy")
    expect(user.middle_name).to eq("Levi")
    expect(user.last_name).to eq("Campbell")
  end

  it "can split name into multiple middle names" do
    user = FactoryGirl.build(:user, name: "Timothy Levi Warner Campbell")
    expect(user.middle_name).to eq("Levi Warner")
  end

  it "creates tokens before saving" do
    user = FactoryGirl.create(:user)
    expect(user.pwreset_token).not_to be_nil
    expect(user.auth_token).not_to be_nil
    expect(user.session_token).not_to be_nil
  end

  it "class generates a random token" do
    token1 = User.generate_token
    token2 = User.generate_token
    expect(token1).not_to eq(token2)
  end

end
