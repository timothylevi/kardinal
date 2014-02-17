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

    it "validates presence of authorization token" do
      user = FactoryGirl.build(:user, auth_token: nil)
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
      expect(user.auth_token).not_to be_nil
      expect(user.session_token).not_to be_nil
    end

  end

  context "class methods" do
    it "generates a random token" do
      token1 = User.generate_token
      token2 = User.generate_token
      expect(token1).not_to eq(token2)
    end
  end

  context "before saving" do

  end

  context "name methods" do
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
  end

  context "password methods" do
    it "sets password digest when given a password" do
      user = FactoryGirl.build(:user)
      expect(user.pw_digest).not_to be_nil
    end

    it "does not store the password after saving" do
      user0 = FactoryGirl.create(:user, name: "Timothy")
      user1 = User.find_by_name("Timothy")
      expect(user1.password).to be_nil
    end

    it "can check a password against password digest" do
      password = "password"
      user = FactoryGirl.build(:user, password: password)
      expect(user.is_password?(password)).to be_true
    end
  end

  context "token methods" do
    it "resets it's tokens and saves the model" do
      user = FactoryGirl.build(:user)
      session_token = user.session_token
      pwreset_token = user.pwreset_token
      auth_token = user.auth_token

      user.reset_session_token!
      expect(user.session_token).not_to eq(session_token)
      expect(user.pwreset_token).not_to eq(pwreset_token)
      expect(user.auth_token).not_to eq(auth_token)
    end
  end

end
