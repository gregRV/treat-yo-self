require 'rails_helper'

describe "user sign-up process", :type => :feature do
	context "with valid info" do
		before(:each) do
			sign_up('alan', 'alan@example.com', 'alan', 'alan')
		end

		it "displays notice that sign-up was successful" do
			expect(page).to have_content('Sign-up Successful!')
		end

		it 'redirects to user page' do
			expect(current_path).to eq("/users/#{User.last.id}")
		end
	end

	context 'with invalid info' do
		before(:each) do
			sign_up('', 'alan@example.com', 'alan', 'alan')
		end

		it 'displays new user page' do
			expect(page).to have_content('Sign Up')
		end

		it 'displays sign up error' do
			expect(page).to have_content('Sign-up Failed')
		end
	end
end

private

def sign_up(name, email, password, password_confirmation)
	visit new_user_path

	fill_in 'Name', with: name
	fill_in 'Email', with: email
	fill_in 'Password', with: password
	fill_in 'Confirm Password', with: password_confirmation

	click_button 'Submit'
end