require 'rails_helper'

RSpec.feature "Homes", type: :feature do

    it "loads the home page" do
       visit '/'
       expect(page).to have_content 'Welcome'
    end
end
