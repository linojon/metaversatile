require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do

  describe "Without registration" do

    context "success" do
      before :each do
        visit '/profiles/new'
        fill_in 'Email', with: 'test@example.com'
        click_on 'Next'
      end

      it "creates a profile record" do
        expect(Profile.count).to eql 1
        expect(Profile.find_by email: 'test@example.com').to be_present
      end

      it "redirects to home" do
        expect(page).to have_current_path(root_path)
      end

      it "success flash message" do
        expect(page).to have_content 'Thank you for your interest in Meta.versatile'
      end

      it "sends a welcome email"
    end

    it "error flash message"

    it "does nothing if email exists and flash message" 
  end

end
