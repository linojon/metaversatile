require 'rails_helper'

RSpec.describe Profile, type: :model do

  it { should belong_to(:user) }

  describe "email validation" do
    it "recognizes valid emails" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |email|
        profile = Profile.new email: email
        expect(profile).to be_valid
      end
    end

    it "requires presence" do
      profile = Profile.new 
      expect(profile.valid?).to be_falsey
      expect(profile.errors.messages[:email]).to include("can't be blank")
    end

    it "require uniqueness" do
      exists = FactoryGirl.create :profile
      profile = Profile.new email: exists.email
      expect(profile).to_not be_valid
      expect(profile.errors.messages[:email]).to include("has already been taken")
    end

    #it "requires 3-254 chars"

    it "require email format" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |email|
        profile = Profile.new email: email
        expect(profile).to_not be_valid
        expect(profile.errors.messages[:email]).to include("is invalid")
      end
    end

  end
end
