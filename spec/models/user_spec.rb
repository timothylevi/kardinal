# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)      not null
#  pw_digest          :string(255)      not null
#  name               :string(255)      not null
#  pwreset_token      :string(255)      not null
#  session_token      :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  activated          :string(255)      default("f")
#  activation_token   :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  provider           :string(255)
#  uid                :string(255)
#

require 'spec_helper'

describe User do

  context "while validating" do
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

    it "validates presence of activation token" do
      user = FactoryGirl.build(:user, activation_token: nil)
      expect(user).to be_valid
    end

    it "validates presence of session token" do
      user = FactoryGirl.build(:user, session_token: nil)
      expect(user).to be_valid
    end

    it "validates uniqueness of email" do
      user0 = FactoryGirl.create(:user, email: "owner@example.com")
      user1 = FactoryGirl.build(:user, email: "owner@example.com")
      expect(user1).not_to be_valid
    end

    it "validates length of password" do
      user = FactoryGirl.build(:user, password: "pass")
      expect(user).not_to be_valid
    end

    it "allows for password attribute to be nil" do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to be_valid
    end

    it "creates tokens before saving" do
      user = FactoryGirl.create(:user)
      expect(user.pwreset_token).not_to be_nil
      expect(user.activation_token).not_to be_nil
      expect(user.session_token).not_to be_nil
    end

  end

  context "class methods" do
    it "::generate_token generates a random token" do
      token1 = User.generate_token
      token2 = User.generate_token
      expect(token1).not_to eq(token2)
    end

    it "::create_from_fb(fb_data) creates a user from Facebook data" do
      fb_data = {
        uid: 123456,
        provider: "facebook",
        info: {
          location: "New York, New York",
          email: "tlc9406@gmail.com",
          name: "Timothy Levi Campbell",
          password: Faker::Internet.password,
          image: "https://scontent-a.xx.fbcdn.net/hphotos-ash3/t1/1780910_10152225732661620_621223880_n.jpg"
        }
      }

      u = User.create_from_fb(fb_data)
      expect(u.uid).to eq(fb_data[:uid])
      expect(u.provider).to eq(fb_data[:provider])
      expect(u.first_name).to eq("Timothy")
      expect(u.last_name).to eq("Campbell")

    end
  end

  context "name methods" do
    it "#first_name and #last_name split name into first and last" do
      user = FactoryGirl.build(:user, name: "Timothy Campbell")
      expect(user.first_name).to eq("Timothy")
      expect(user.last_name).to eq("Campbell")
    end

    it "#first_name, #middle_name, and #last_name split name into first, middle, and last" do
      user = FactoryGirl.build(:user, name: "Timothy Levi Campbell")
      expect(user.first_name).to eq("Timothy")
      expect(user.middle_name).to eq("Levi")
      expect(user.last_name).to eq("Campbell")
    end

    it "#middle_name can split name into multiple middle names" do
      user = FactoryGirl.build(:user, name: "Timothy Levi Warner Campbell")
      expect(user.middle_name).to eq("Levi Warner")
    end
  end

  context "password methods" do
    it "#password= sets password digest when given a password" do
      user = FactoryGirl.build(:user)
      expect(user.pw_digest).not_to be_nil
    end

    it "does not store the password after saving" do
      user0 = FactoryGirl.create(:user, name: "Timothy")
      user1 = User.find_by_name("Timothy")
      expect(user1.password).to be_nil
    end

    it "#is_password? can check a password against password digest" do
      password = "password"
      user = FactoryGirl.build(:user, password: password)
      expect(user.is_password?(password)).to be_true
    end
  end

  context "token methods" do
    it "#ensure_tokens saves tokens before " do
      user = FactoryGirl.create(:user)

      expect(user.session_token).not_to be_nil
      expect(user.activation_token).not_to be_nil
      expect(user.pwreset_token).not_to be_nil
    end

    it "resets it's tokens and saves the model" do
      user = FactoryGirl.create(:user)
      session_token = user.session_token
      activation_token = user.activation_token

      user.reset_session_token!
      user.reset_activation_token!

      expect(user.session_token).not_to eq(session_token)
      expect(user.activation_token).not_to eq(activation_token)
    end
  end

end
