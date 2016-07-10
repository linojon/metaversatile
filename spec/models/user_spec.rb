require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates default profile before create" do
    user = User.new email: 'test@example.com', password: 'secret123', password_confirmation: 'secret123'
    ##user.skip_confirmation!

    user.save
    
    expect(user.profile).to be_present
    expect(user.profile.email).to eql user.email
  end

  it "saves default profile on create" do
    user = User.new email: 'test@example.com', password: 'secret123', password_confirmation: 'secret123'
    ##user.skip_confirmation!

    user.save
    uuu = User.find user.id
    
    expect(uuu.profile).to be_present
    expect(uuu.profile.email).to eql user.email
  end
end
