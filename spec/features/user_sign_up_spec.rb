require 'rails_helper'

describe "user sign-up process", :type => :feature do
	context "with valid info" do
		it "creates a new user" do
			visit new_user_path

			fill_in 'Name', with: 'alan'
			fill_in 'Email', with: 'alan@example.com'
			fill_in 'Password', with: 'alan'
			fill_in 'Confirm Password', with: 'alan'

			click_button 'Submit'

			expect(page).to have_content('Sign-up Successful!')
		end
	end
end