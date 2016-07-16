require 'rails_helper'

RSpec.feature "Project Membership", type: :feature do

  describe "join" do

    let(:project) { FactoryGirl.create :project }
    let(:user) { FactoryGirl.create :user }

    before :each do
      sign_in user
    end

    it "joins a project" do
      visit "/projects/#{project.to_param}"
      click_on "Join"
      user.reload
      expect(user.projects).to include project
    end


    it "already a member"

  end
end